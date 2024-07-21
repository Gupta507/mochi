-- CreateTable
CREATE TABLE "WatchList" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "WatchList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Anime" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Anime_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AnimeToWatchList" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "WatchList_userId_key" ON "WatchList"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_AnimeToWatchList_AB_unique" ON "_AnimeToWatchList"("A", "B");

-- CreateIndex
CREATE INDEX "_AnimeToWatchList_B_index" ON "_AnimeToWatchList"("B");

-- AddForeignKey
ALTER TABLE "WatchList" ADD CONSTRAINT "WatchList_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AnimeToWatchList" ADD CONSTRAINT "_AnimeToWatchList_A_fkey" FOREIGN KEY ("A") REFERENCES "Anime"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AnimeToWatchList" ADD CONSTRAINT "_AnimeToWatchList_B_fkey" FOREIGN KEY ("B") REFERENCES "WatchList"("id") ON DELETE CASCADE ON UPDATE CASCADE;
