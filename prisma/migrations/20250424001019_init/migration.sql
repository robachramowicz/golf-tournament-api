/*
  Warnings:

  - You are about to drop the `GroupMembers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GroupPlayers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Groups` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GroupMembers" DROP CONSTRAINT "GroupMembers_groupId_fkey";

-- DropForeignKey
ALTER TABLE "GroupMembers" DROP CONSTRAINT "GroupMembers_memberId_fkey";

-- DropForeignKey
ALTER TABLE "GroupPlayers" DROP CONSTRAINT "GroupPlayers_groupMemberId_fkey";

-- DropTable
DROP TABLE "GroupMembers";

-- DropTable
DROP TABLE "GroupPlayers";

-- DropTable
DROP TABLE "Groups";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "groups" (
    "id" SERIAL NOT NULL,
    "group_name" TEXT NOT NULL,
    "scoring_type" TEXT NOT NULL,
    "draft_type" TEXT NOT NULL,
    "draft_complete" BOOLEAN NOT NULL DEFAULT false,
    "draft_started" BOOLEAN NOT NULL DEFAULT false,
    "year" INTEGER NOT NULL,
    "tournament_id" TEXT NOT NULL,

    CONSTRAINT "groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "group_members" (
    "id" SERIAL NOT NULL,
    "member_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "team_name" TEXT NOT NULL,

    CONSTRAINT "group_members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "group_players" (
    "id" SERIAL NOT NULL,
    "group_member_id" INTEGER NOT NULL,
    "player_id" INTEGER NOT NULL,

    CONSTRAINT "group_players_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- AddForeignKey
ALTER TABLE "group_members" ADD CONSTRAINT "group_members_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_members" ADD CONSTRAINT "group_members_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "group_players" ADD CONSTRAINT "group_players_group_member_id_fkey" FOREIGN KEY ("group_member_id") REFERENCES "group_members"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
