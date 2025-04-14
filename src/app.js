import express from 'express'
// import pool from './db.js'
import authRoutes from './routes/authRoutes.js'
import authMiddleware from './middleware/authMiddleware.js'

const app = express()
const port = process.env.PORT || 3000
app.use(express.json())

app.use('/auth', authRoutes)

// example with middleware
// app.use('/todos', authMiddleware, todoRoutes)


app.listen(port, () => {
  console.log("Server Listening on port:", port)
})

// app.post('/create-group', async (request, response) => {
// 	const {tournamentId, groupName, scoringType, year, draftStarted, draftType} = request.body

// 	try {
// 		await pool.query(
// 			'INSERT INTO groups (tournament_id, group_name, scoring_type, year, draft_started, draft_type) VALUES ($1, $2, $3, $4, $5, $6, $7)', 
// 			[tournamentId, groupName, scoringType, year, draftStarted, draftType]
// 		)
// 		response.status(200).send({message: 'Successfully added group'})
// 	}
// 	catch (e) {
// 		console.log(e)
// 		response.sendStatus(500)
// 	}
// })

// app.get('/groups', async (request, response) => {
// 	try {
// 		const data = await pool.query('SELECT * FROM groups')
// 		response.status(200).send({groups: data.rows})
// 	}
// 	catch (e) {
// 		console.log(e)
// 		response.sendStatus(500)
// 	}
// })