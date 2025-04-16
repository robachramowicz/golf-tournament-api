import express from 'express'
import prisma from '../prismaClient.js'

const router = express.Router()

router.post('/create-group', async (req, res) => {
  const { tournamentId, groupName, scoringType, year, draftType, teamName } = req.body

  const userId = req.userId

  try {
    const group = await prisma.group.create({
      data: {
        tournamentId,
        groupName,
        scoringType,
        year,
        draftType
      } 
    })

    await prisma.groupMembers.create({
      data: {
        member: {
          connect: { id: userId },
        },
        group: {
          connect: { id: group.id },
        },
        teamName: teamName,
      },
    })

    res.status(200).send({ message: 'Successfully added group', group })
  } catch (e) {
    console.log(e)
    res.sendStatus(500)
  }
}
)
