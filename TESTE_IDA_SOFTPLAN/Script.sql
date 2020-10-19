--<ScriptOptions statementTerminator=";"/>

CREATE TABLE "Schema"."user_type" (
		"cd_user_type_id" SERIAL NOT NULL,
		"nm_name" VARCHAR(150) NOT NULL
	);

CREATE TABLE "Schema"."user" (
		"cd_user" SERIAL NOT NULL,
		"nm_name" VARCHAR(150) NOT NULL,
		"de_email" VARCHAR(100) NOT NULL,
		"nu_type" INTEGER NOT NULL,
		"fl_admin" BOOL NOT NULL,
		"de_password" CHAR(32) NOT NULL,
		"cd_user_type_id" SERIAL NOT NULL
	);

CREATE TABLE "Schema"."employee" (
		"cd_employee_id" SERIAL NOT NULL,
		"fl_active" BOOL NOT NULL,
		"cd_user" SERIAL NOT NULL
	);

CREATE TABLE "Schema"."service" (
		"cd_service_id" SERIAL NOT NULL,
		"nm_name" VARCHAR(100) NOT NULL,
		"de_description" VARCHAR(2000) NOT NULL,
		"mo_value" MONEY NOT NULL,
		"nu_duration" INTEGER NOT NULL
	);

CREATE TABLE "Schema"."employee_service" (
		"cd_employee_id" SERIAL NOT NULL,
		"cd_service_id" SERIAL NOT NULL
	);

CREATE TABLE "Schema"."scheduling" (
		"cd_service_id" SERIAL NOT NULL,
		"cd_employee_id" SERIAL NOT NULL,
		"dt_date" TIMESTAMP NOT NULL,
		"mo_total_value" MONEY DEFAULT CURRENT_TIMESTAMP NOT NULL
	);

ALTER TABLE "Schema"."user_type" ADD CONSTRAINT "user_PK" PRIMARY KEY
	("cd_user_type_id");

ALTER TABLE "Schema"."user" ADD CONSTRAINT "user_PK" PRIMARY KEY
	("cd_user");

ALTER TABLE "Schema"."employee" ADD CONSTRAINT "employee_PK" PRIMARY KEY
	("cd_employee_id");

ALTER TABLE "Schema"."service" ADD CONSTRAINT "service_PK" PRIMARY KEY
	("cd_service_id");

ALTER TABLE "Schema"."employee_service" ADD CONSTRAINT "employee_service_PK" PRIMARY KEY
	("cd_employee_id",
	 "cd_service_id");

ALTER TABLE "Schema"."scheduling" ADD CONSTRAINT "scheduling_PK" PRIMARY KEY
	("cd_service_id",
	 "cd_employee_id");

ALTER TABLE "Schema"."user" ADD CONSTRAINT "user_user_type_FK" FOREIGN KEY 
	("cd_user_type_id")
	REFERENCES "Schema"."user_type" 
	("cd_user_type_id")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Schema"."employee" ADD CONSTRAINT "employee_user_FK" FOREIGN KEY 
	("cd_user")
	REFERENCES "Schema"."user" 
	("cd_user")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Schema"."employee_service" ADD CONSTRAINT "employee_service_employee_FK" FOREIGN KEY 
	("cd_employee_id")
	REFERENCES "Schema"."employee" 
	("cd_employee_id")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Schema"."employee_service" ADD CONSTRAINT "employee_service_service_FK" FOREIGN KEY 
	("cd_service_id")
	REFERENCES "Schema"."service" 
	("cd_service_id")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Schema"."scheduling" ADD CONSTRAINT "scheduling_service_FK" FOREIGN KEY 
	("cd_service_id")
	REFERENCES "Schema"."service" 
	("cd_service_id")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Schema"."scheduling" ADD CONSTRAINT "scheduling_employee_FK" FOREIGN KEY 
	("cd_employee_id")
	REFERENCES "Schema"."employee" 
	("cd_employee_id")
	NOT DEFERRABLE INITIALLY IMMEDIATE;

