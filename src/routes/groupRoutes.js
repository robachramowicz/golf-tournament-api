import express from 'express'
import prisma from '../prismaClient.js'

const router = express.Router()

router.post('/create-group', async (req, res) => {
  const { tournamentId, groupName, scoringType, year, draftType, teamName } = req.body

  const userId = req.userId

  try {
    const existingGroup = await prisma.groups.findFirst({
      where: {
        tournamentId: tournamentId,
        groupName: groupName,
      },
    })

    if (existingGroup) {
      return res.status(400).send({ message: 'Group name already exists for this tournament' })
    }
    console.log('here1')
    const group = await prisma.groups.create({
      data: {
        tournamentId,
        groupName,
        scoringType,
        year,
        draftType
      } 
    })
    console.log('here2')
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
})

router.get('/user-groups', async (req, res) => {
  const userId = req.userId

  try {
    const groups = await prisma.groupMembers.findMany({
      where: {
        memberId: userId,
      },
      include: {
        group: true,
      },
    })

    res.status(200).send(groups.map(groupMember => groupMember.group))
  } catch (e) {
    console.log(e)
    res.sendStatus(500)
  }
})


router.get('/all-groups', async (req, res) => {
  try {
    const groups = await prisma.group.findMany()
    res.status(200).send(groups)
  } catch (e) {
    console.log(e)
    res.sendStatus(500)
  }
})

export default router