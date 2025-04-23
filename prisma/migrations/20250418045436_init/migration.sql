-- CreateTable
CREATE TABLE "Groups" (
    "id" SERIAL NOT NULL,
    "groupName" TEXT NOT NULL,
    "scoringType" TEXT NOT NULL,
    "draftType" TEXT NOT NULL,
    "draftComplete" BOOLEAN NOT NULL DEFAULT false,
    "draftStarted" BOOLEAN NOT NULL DEFAULT false,
    "year" INTEGER NOT NULL,
    "tournamentId" TEXT NOT NULL,

    CONSTRAINT "Groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupMembers" (
    "id" SERIAL NOT NULL,
    "memberId" INTEGER NOT NULL,
    "groupId" INTEGER NOT NULL,
    "teamName" TEXT NOT NULL,

    CONSTRAINT "GroupMembers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupPlayers" (
    "id" SERIAL NOT NULL,
    "groupMemberId" INTEGER NOT NULL,
    "playerId" INTEGER NOT NULL,

    CONSTRAINT "GroupPlayers_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "GroupMembers" ADD CONSTRAINT "GroupMembers_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupMembers" ADD CONSTRAINT "GroupMembers_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Groups"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupPlayers" ADD CONSTRAINT "GroupPlayers_groupMemberId_fkey" FOREIGN KEY ("groupMemberId") REFERENCES "GroupMembers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
