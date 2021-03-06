--<ScriptOptions statementTerminator="GO"/>

ALTER TABLE SAJ.ECCPTABELA DROP CONSTRAINT RCCPTABELAINDEXA
GO

ALTER TABLE SAJ.ECCPTABELA DROP CONSTRAINT XPKECCPTABELA
GO

DROP INDEX XIF34ECCPTABELA ON SAJ.ECCPTABELA
GO

DROP TABLE SAJ.ECCPTABELA
GO

CREATE TABLE SAJ.ECCPTABELA (
		CDTABELA DECIMAL(4 , 0) NOT NULL,
		DETABELA VARCHAR(50) NOT NULL,
		DTVIGENCIA DATETIME NULL,
		FLTIPOINTERVAL CHAR(1) CONSTRAINT ECCPTABELA_FLTIPOINTERVAL_DF DEFAULT 'V' NOT NULL,
		CDINDEXADOR DECIMAL(4 , 0) NULL,
		FLBASECALC CHAR(1) CONSTRAINT ECCPTABELA_FLBASECALC_DF DEFAULT 'I' NOT NULL,
		FLTIPOAPLICADO CHAR(1) CONSTRAINT ECCPTABELA_FLTIPOAPLICADO_DF DEFAULT 'V' NOT NULL,
		PEEXCEDENTE DECIMAL(5 , 2) NULL,
		CDUSUINCLUSAO CHAR(15) NULL,
		DTUSUINCLUSAO DATETIME NULL
	)
	ON [TSCCPBAS1DAT]
GO

CREATE INDEX XIF34ECCPTABELA
	ON SAJ.ECCPTABELA
	(CDINDEXADOR		ASC)
	ON [TSCCPBAS1IDX]
GO

ALTER TABLE SAJ.ECCPTABELA ADD CONSTRAINT XPKECCPTABELA PRIMARY KEY CLUSTERED
	(CDTABELA)
GO

ALTER TABLE SAJ.ECCPTABELA ADD CONSTRAINT RCCPTABELAINDEXA FOREIGN KEY
	(CDINDEXADOR)
	REFERENCES SAJ.ESAJINDEXADOR
	(CDINDEXADOR)
GO

