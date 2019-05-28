#!/usr/bin/env bash
NETWORK="development"

echo "Query Tokens From dex-smart-contract"
node scripts/query_tokens.js $NETWORK

echo "Drop existing collections"
node drop_collection.js --collection pairs
node drop_collection.js --collection tokens
node drop_collection.js --collection orders
node drop_collection.js --collection trades
node drop_collection.js --collection wallets
node drop_collection.js --collection accounts
node drop_collection.js --collection config

echo "Create collections"
node create_accounts_collection.js
node create_orders_collection.js
node create_pairs_collection.js
node create_tokens_collection.js
node create_trades_collection.js
node create_wallets_collection.js
node create_config_collection.js


echo "Seed data"
node seed_tokens.js --network=$NETWORK
node seed_pairs.js --network=$NETWORK
node seed_config.js --network=$NETWORK
node seed_wallets.js --network=$NETWORK
