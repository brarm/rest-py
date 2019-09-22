const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
	response.json({ info: 'Node.js, Express, and Postgres API'})
})

app.get('/users', db.getUsers)
app.get('/users/:id', db.getUserById)
app.post('/users', db.createUser)
app.put('/users/:id', db.updateUser)
app.delete('/users/:id', db.deleteUser)

// ref - https://jasonwatmore.com/post/2018/09/24/nodejs-basic-authentication-tutorial-with-example-api
app.get('/secrets', (request, response) => {
	if (!request.headers.authorization || 
			request.headers.authorization.indexOf('Basic') === -1 ) {
		return response.status(401).json({ message: 'Missing Authorization Header'})
	}
	const base64Credentials = request.headers.authorization.split(' ')[1]
	const credentials = Buffer.from(base64Credentials, 'base64').toString('ascii')
	const [username, password] = credentials.split(':')
	
	if (username === 'admin') {
		return db.getSecrets(request, response)
	}
	else {
		return response.status(401).json({ message: 'User is not authorized'})
	}

})

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})