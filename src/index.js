const express = require('express')
const morgan = require('morgan')
const fs = require('fs')

const app = express()
const port = 3000

// create a write stream (in append mode)
const accessLogStream = fs.createWriteStream('/data/access.log', { flags: 'a' })

app.use(morgan('combined', { stream: accessLogStream }))

app.get('/', (req, res) => {
  res.send('Hello World!\n')
})

app.get('/shutdown', (req, res) => {
  process.exit()
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
