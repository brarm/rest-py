#!/bin/bash

# ensure that postgres service is running

# connect to postgres and create me user
psql -d postgres -f ./create_user.sql --echo-errors --set AUTOCOMMIT=on --set ON_ERROR_STOP=on;

# create api database and populate tables
psql -d postgres -U me -f ./create_dbs.sql --echo-all --set AUTOCOMMIT=off;
