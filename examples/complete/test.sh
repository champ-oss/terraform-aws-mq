set -e

if [[ ! "$BROKER_HOST" =~ \.on\.aws$ ]]; then
  echo "broker_host does not end with .on.aws"
  echo "   Value: $BROKER_HOST"
  exit 1
fi
