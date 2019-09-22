#!/bin/bash

### Ensure that node and npm are installed

mkdir node-api-postgres
cd node-api-postgres

npm init -y
# install express and postgres
npm i express pg