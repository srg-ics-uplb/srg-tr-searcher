DROP TABLE IF EXISTS PDF;
CREATE TABLE IF NOT EXISTS PDF (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  NAME           TEXT    NOT NULL,
  HASH           TEXT    NOT NULL,
  DATE           INT     NOT NULL,
  TITLE          TEXT    NOT NULL,
  AUTHORS        TEXT    NOT NULL,
  DEPARTMENT     TEXT DEFAULT "ICS",
  COLLEGE        TEXT DEFAULT "CAS",
  CAMPUS         TEXT DEFAULT "UPLB",
  ABSTRACT       TEXT,
  INDEX_TERMS    TEXT,
  YEAR           TEXT    NOT NULL,
  MONTH          TEXT    NOT NULL,
  UPLOADED_BY    TEXT,
  STATUS         INTEGER,
  METADATA       TEXT,
  CREATED_AT     DATETIME DEFAULT CURRENT_TIMESTAMP,
  UPDATED_AT     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS FREQ;
CREATE TABLE IF NOT EXISTS FREQ (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  PDF_ID         INT     NOT NULL,
  WORD           TEXT    NOT NULL,
  W_FREQ         REAL    NOT NULL
);

DROP TABLE IF EXISTS PDF_STATUS;
CREATE TABLE IF NOT EXISTS PDF_STATUS (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  NAME           TEXT    NOT NULL
);

INSERT INTO pdf_status (name) VALUES ('SUBMITTED'), ('APPROVED'), ('REMOVED');

DROP TABLE IF EXISTS LOGS;
CREATE TABLE IF NOT EXISTS LOGS (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  userid        TEXT,
  pdfid         INTEGER,
  activity      TEXT,
  created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (pdfid) REFERENCES PDF(ID)
);