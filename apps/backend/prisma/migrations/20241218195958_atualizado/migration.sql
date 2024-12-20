/*
  Warnings:

  - You are about to drop the column `imagemUrl` on the `profissional` table. All the data in the column will be lost.
  - Added the required column `imagemURL` to the `profissional` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_profissional" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "imagemURL" TEXT NOT NULL,
    "avaliacao" REAL NOT NULL,
    "quantidadeAvaliacoes" INTEGER NOT NULL
);
INSERT INTO "new_profissional" ("avaliacao", "descricao", "id", "nome", "quantidadeAvaliacoes") SELECT "avaliacao", "descricao", "id", "nome", "quantidadeAvaliacoes" FROM "profissional";
DROP TABLE "profissional";
ALTER TABLE "new_profissional" RENAME TO "profissional";
CREATE UNIQUE INDEX "profissional_nome_key" ON "profissional"("nome");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
