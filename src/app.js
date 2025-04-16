import express from 'express'
// import pool from './db.js'
import authRoutes from './routes/authRoutes.js'
import groupRoutes from './routes/groupRoutes.js'
import authMiddleware from './middleware/authMiddleware.js'

const app = express()
const port = process.env.PORT || 3000
app.use(express.json())

app.use('/auth', authRoutes)
app.use('/groups', authMiddleware, groupRoutes)

app.listen(port, () => {
  console.log("Server Listening on port:", port)
})