package test

import (
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// TestExamplesComplete tests a typical deployment of this module. It will verify the SSM parameter is set correctly
// and that snapshots are all working as expected.
func TestExamplesCluster(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{TerraformDir: "../../examples/complete"}
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	logger.Log(t, "validating console_url exist and not empty")
	// Run `terraform output` to get the value of an output variable
	consoleUrl := terraform.Output(t, terraformOptions, "console_url")
	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, consoleUrl)

	logger.Log(t, "validating AMQP ssl endpoint exist and not empty")
	// Run `terraform output` to get the value of an output variable
	primaryAmqpSslEndpoint := terraform.Output(t, terraformOptions, "primary_amqp_ssl_endpoint")
	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, primaryAmqpSslEndpoint)

	logger.Log(t, "validating broker host exist and not empty")
	// Run `terraform output` to get the value of an output variable
	brokerHost := terraform.Output(t, terraformOptions, "broker_host")
	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, brokerHost)

	logger.Log(t, "validating deployment is cluster multi az")
	// Run `terraform output` to get the value of an output variable
	brokerId := terraform.Output(t, terraformOptions, "broker_id")
	// Verify we're getting back the outputs we expect
	assert.NotEmpty(t, brokerId)

	logger.Log(t, "validating broker arn contains git var and broker id")
	// Run `terraform output` to get the value of an output variable
	brokerArn := terraform.Output(t, terraformOptions, "broker_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, brokerArn, "broker:terraform-aws-mq")
	assert.Contains(t, brokerArn, brokerId)
}
