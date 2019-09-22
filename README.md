# A Prototype API Endpoint Communicator

API requires:
- node
- npm
- postgresql

Install using:
```
sudo apt install nodejs

# check node and npm install
node -v
npm -v

sudo apt install postgresql

```

Communicator requires:
- Python 3.7

Using pyenv is recommended
```
curl https://pyenv.run | bash
```

### Setup
Ensure that prerequisites above are installed

run:
```
./psql.sh
./setup-node.sh
```

### Run

To run the API Server:
```
cd node-api-postgres
node index.js
```
The port the server runs on can be set in index.js. Default is 3000

To test server queries manually:
```
curl http://localhost.com:3000/users
```

### API Endpoints

GET 	/users
GET		/users/:id
POST 	/users
PUT 	/users/:id
DELETE	/users/:id

