-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         Microsoft SQL Server 2022 (RTM) - 16.0.1000.6
-- SO del servidor:              Windows 10 Home 10.0 <X64> (Build 22631: ) (Hypervisor)
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para GestionUsuarios
CREATE DATABASE IF NOT EXISTS "GestionUsuarios";
USE "GestionUsuarios";

-- Volcando estructura para tabla GestionUsuarios.paises
CREATE TABLE IF NOT EXISTS "paises" (
	"id" INT NOT NULL,
	"pais" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla GestionUsuarios.paises: -1 rows
/*!40000 ALTER TABLE "paises" DISABLE KEYS */;
INSERT INTO "paises" ("id", "pais") VALUES
	(1, 'El Salvador'),
	(2, 'Mexico'),
	(3, 'Colombia'),
	(4, 'Rusia'),
	(5, 'Honduras');
/*!40000 ALTER TABLE "paises" ENABLE KEYS */;

-- Volcando estructura para tabla GestionUsuarios.roles
CREATE TABLE IF NOT EXISTS "roles" (
	"r1_id" INT NOT NULL,
	"r1_nombre" VARCHAR(45) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("r1_id")
);

-- Volcando datos para la tabla GestionUsuarios.roles: -1 rows
/*!40000 ALTER TABLE "roles" DISABLE KEYS */;
INSERT INTO "roles" ("r1_id", "r1_nombre") VALUES
	(1, 'Administrador'),
	(2, 'Editor'),
	(3, 'Publicador');
/*!40000 ALTER TABLE "roles" ENABLE KEYS */;

-- Volcando estructura para tabla GestionUsuarios.roles_usuarios
CREATE TABLE IF NOT EXISTS "roles_usuarios" (
	"rlu_id" INT NOT NULL,
	"rlu_usr_id" INT NULL DEFAULT NULL,
	"rlu_r1_id" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "fk_Roles" ("rlu_r1_id"),
	FOREIGN KEY INDEX "fk_Usuario" ("rlu_usr_id"),
	PRIMARY KEY ("rlu_id"),
	CONSTRAINT "fk_Usuario" FOREIGN KEY ("rlu_usr_id") REFERENCES "usuarios" ("usr_id") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "fk_Roles" FOREIGN KEY ("rlu_r1_id") REFERENCES "roles" ("r1_id") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Volcando datos para la tabla GestionUsuarios.roles_usuarios: -1 rows
/*!40000 ALTER TABLE "roles_usuarios" DISABLE KEYS */;
INSERT INTO "roles_usuarios" ("rlu_id", "rlu_usr_id", "rlu_r1_id") VALUES
	(8, 1, 1),
	(9, 1, 2),
	(10, 2, 1),
	(11, 2, 2),
	(12, 3, 2),
	(13, 4, 2),
	(14, 4, 3);
/*!40000 ALTER TABLE "roles_usuarios" ENABLE KEYS */;

-- Volcando estructura para tabla GestionUsuarios.sysdiagrams
CREATE TABLE IF NOT EXISTS "sysdiagrams" (
	"name" NVARCHAR(128) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"principal_id" INT NOT NULL,
	"diagram_id" INT NOT NULL,
	"version" INT NULL DEFAULT NULL,
	"definition" VARBINARY NULL DEFAULT NULL,
	PRIMARY KEY ("diagram_id"),
	UNIQUE INDEX "UK_principal_name" ("name", "principal_id")
);

-- Volcando datos para la tabla GestionUsuarios.sysdiagrams: -1 rows
/*!40000 ALTER TABLE "sysdiagrams" DISABLE KEYS */;
/*!40000 ALTER TABLE "sysdiagrams" ENABLE KEYS */;

-- Volcando estructura para tabla GestionUsuarios.usuarios
CREATE TABLE IF NOT EXISTS "usuarios" (
	"usr_id" INT NOT NULL,
	"usr_nombre" VARCHAR(45) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"usr_apellido" VARCHAR(45) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"usr_email" VARCHAR(150) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_pais" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_usuarios_paises" ("id_pais"),
	PRIMARY KEY ("usr_id"),
	CONSTRAINT "FK_usuarios_paises" FOREIGN KEY ("id_pais") REFERENCES "paises" ("id") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Volcando datos para la tabla GestionUsuarios.usuarios: 13 rows
/*!40000 ALTER TABLE "usuarios" DISABLE KEYS */;
INSERT INTO "usuarios" ("usr_id", "usr_nombre", "usr_apellido", "usr_email", "id_pais") VALUES
	(1, 'Armando', 'NH', 'armando@mail.com', 3),
	(2, 'Vanessa', 'AP', 'vane@mail.com', 4),
	(3, 'Karla', 'AW', 'karla@mail.com', 2),
	(4, 'Alberto', 'ER', 'alberto@mail.com', 2),
	(6, 'Guillermo', 'Minero', 'mineromemo@gmail.com', 3),
	(8, 'Guillermo', 'Minero', 'mineromemo@gmail.com', 4),
	(10, 'Guillermo', 'Minero', 'mineromemo@gmail.com', 2),
	(11, 'sfasd', 'adsd', 'adads@asdads.com', 3),
	(12, 'sfasd', 'adsd', 'adads@asdads.com', 2),
	(13, 'Guillermo', 'Minero', 'mineromemo@gmail.com', 3),
	(14, 'prueba', 'prueba', 'prueba@gmail.com', 2),
	(15, 'prueba', 'prueba', 'prueba@gmail.com', 4),
	(16, 'prueba', 'prueba', 'peueba@gmail.com', 4),
	(17, 'Guillermo', 'Minero', 'asa@gmail.com', 3);
/*!40000 ALTER TABLE "usuarios" ENABLE KEYS */;

-- Volcando estructura para procedimiento GestionUsuarios.sp_alterdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_creatediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_dropdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_helpdiagramdefinition
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_helpdiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_renamediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento GestionUsuarios.sp_upgraddiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	//
DELIMITER ;

-- Volcando estructura para función GestionUsuarios.fn_diagramobjects
DELIMITER //

	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
