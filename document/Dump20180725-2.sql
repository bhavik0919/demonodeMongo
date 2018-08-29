-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 192.168.1.135    Database: lcmdev
-- ------------------------------------------------------
-- Server version	5.6.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` char(38) NOT NULL,
  `EntityType` varchar(50) NOT NULL,
  `EntityID` char(38) NOT NULL,
  `AddressType` varchar(50) NOT NULL,
  `AddrLine1` varchar(255) NOT NULL,
  `AddrLine2` varchar(255) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `POBoxNum` varchar(50) DEFAULT NULL,
  `IsPreferred` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assessmenttest`
--

DROP TABLE IF EXISTS `assessmenttest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmenttest` (
  `AssessmentTestID` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) NOT NULL,
  `AssessmentTestDate` datetime NOT NULL,
  `AssessmentTestType` varchar(50) NOT NULL,
  `Level` varchar(50) NOT NULL,
  `TestScore` decimal(5,2) DEFAULT NULL,
  `TimeTakenInSeconds` int(11) DEFAULT NULL,
  `TestOutcome` varchar(50) DEFAULT NULL,
  `Notes` varchar(2000) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`AssessmentTestID`),
  KEY `LPAssignmentHeaderID` (`LPAssignmentHeaderID`),
  CONSTRAINT `assessmenttest_ibfk_1` FOREIGN KEY (`LPAssignmentHeaderID`) REFERENCES `lpassignmentheader` (`LPAssignmentHeaderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concepttoc`
--

DROP TABLE IF EXISTS `concepttoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepttoc` (
  `ConceptTOCID` char(38) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Level` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ConceptTOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conceptworksheet`
--

DROP TABLE IF EXISTS `conceptworksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptworksheet` (
  `ConceptWorksheetID` char(38) NOT NULL,
  `ConceptTOCID` char(38) NOT NULL,
  `WorksheetRangeStartN` int(11) NOT NULL,
  `WorksheetRangeEndN` int(11) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `IsCWAssignment` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ConceptWorksheetID`),
  KEY `ConceptTOCID` (`ConceptTOCID`),
  CONSTRAINT `conceptworksheet_ibfk_1` FOREIGN KEY (`ConceptTOCID`) REFERENCES `concepttoc` (`ConceptTOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `DocumentID` char(38) NOT NULL,
  `DocumentType` varchar(50) NOT NULL,
  `DocumentName` varchar(50) NOT NULL,
  `EntityType` varchar(50) NOT NULL,
  `EntityID` char(38) NOT NULL,
  `DocPath` varchar(500) NOT NULL,
  `Note` text,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`DocumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `EmailID` char(38) NOT NULL,
  `EntityType` varchar(50) NOT NULL,
  `EntityID` char(38) NOT NULL,
  `EmailType` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `IsPreferred` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EmailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailtemplate`
--

DROP TABLE IF EXISTS `emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailtemplate` (
  `EmailTemplateID` char(38) NOT NULL,
  `TemplateType` varchar(50) NOT NULL,
  `TemplateName` varchar(50) NOT NULL,
  `Description` varchar(21844) NOT NULL,
  `EmailSubject` varchar(200) NOT NULL,
  `EmailBody` text NOT NULL,
  `FromEmail` varchar(255) DEFAULT NULL,
  `FromEmailDisplayName` varchar(100) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EmailTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glamap`
--

DROP TABLE IF EXISTS `glamap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glamap` (
  `GLAMapID` char(38) NOT NULL,
  `Grade` varchar(50) NOT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `Level` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `MinCWWorksheet` int(11) NOT NULL,
  `MaxCWWorksheet` int(11) NOT NULL,
  `MedCWWorksheet` int(11) NOT NULL,
  `MedHWWorksheet` int(11) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Active',
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`GLAMapID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `HolidayGUID` char(38) NOT NULL DEFAULT '',
  `HolidayType` varchar(50) DEFAULT NULL,
  `HolidayYear` smallint(4) NOT NULL,
  `HolidayDate` date NOT NULL,
  `HolidayDesc` varchar(5000) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`HolidayGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcmexception`
--

DROP TABLE IF EXISTS `lcmexception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcmexception` (
  `Id` char(38) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `MethodName` varchar(50) NOT NULL,
  `StackTrace` varchar(60000) NOT NULL,
  `Date` datetime NOT NULL,
  `UserId` char(38) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lessonplanscoreassignment`
--

DROP TABLE IF EXISTS `lessonplanscoreassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessonplanscoreassignment` (
  `LessonPlanScoreAssignmentID` char(38) NOT NULL DEFAULT '',
  `StudentID` char(38) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `WorkType` varchar(50) DEFAULT NULL,
  `TimeTakenInSeconds` int(11) DEFAULT NULL,
  `TimeTakenInSecondsAW` int(11) DEFAULT NULL,
  `AdditionalWorkScore` decimal(5,2) DEFAULT NULL,
  `Notes` text,
  `FromTime` time DEFAULT NULL,
  `ToTime` time DEFAULT NULL,
  `SysMessage` varchar(50) DEFAULT NULL,
  `SpecialActivity` varchar(50) DEFAULT NULL,
  `TutorID` char(38) DEFAULT NULL,
  `TutorNote` varchar(2000) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `InstructorNote` varchar(2000) DEFAULT NULL,
  `RequestText` varchar(500) DEFAULT NULL,
  `SpecialActivityDesc` text,
  PRIMARY KEY (`LessonPlanScoreAssignmentID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `lessonplanscoreassignment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpassignmentheader`
--

DROP TABLE IF EXISTS `lpassignmentheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpassignmentheader` (
  `LPAssignmentHeaderID` char(38) NOT NULL DEFAULT '',
  `StudentID` char(38) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `RequestType` varchar(50) DEFAULT NULL,
  `RequestDate` datetime NOT NULL,
  `ApprovalDate` date DEFAULT NULL,
  `ReasonCode` varchar(50) DEFAULT NULL,
  `ReasonOther` varchar(500) DEFAULT NULL,
  `RequestStartDate` datetime NOT NULL,
  `RequestEndDate` datetime DEFAULT NULL,
  `SubmittedBy` char(38) DEFAULT NULL,
  `IsPermanent` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `StatusBy` varchar(50) DEFAULT NULL,
  `DeclineReason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LPAssignmentHeaderID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `lpassignmentheader_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lprequestabsent`
--

DROP TABLE IF EXISTS `lprequestabsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lprequestabsent` (
  `LPRequestAbsentID` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) NOT NULL,
  `RequestOption` varchar(50) NOT NULL,
  `PickupDateTime` date DEFAULT NULL,
  `PickUpTime` varchar(20) DEFAULT NULL,
  `PickupPersonID` char(38) DEFAULT NULL,
  `PickupPersonOther` varchar(200) DEFAULT NULL,
  `MakupDate` datetime DEFAULT NULL,
  `MakupSlotID` char(38) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`LPRequestAbsentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lprequestfeedbackconcept`
--

DROP TABLE IF EXISTS `lprequestfeedbackconcept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lprequestfeedbackconcept` (
  `LPRequestFeedbackConceptID` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) NOT NULL,
  `ConceptID` char(38) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`LPRequestFeedbackConceptID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lprequesttimechange`
--

DROP TABLE IF EXISTS `lprequesttimechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lprequesttimechange` (
  `LPRequestTimeChangeID` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) NOT NULL,
  `CurrentDOW` varchar(50) DEFAULT NULL,
  `CurrentSlotId` char(38) NOT NULL,
  `NewDOW` varchar(50) DEFAULT NULL,
  `NewSlotId` char(38) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`LPRequestTimeChangeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lprequestworksheetchange`
--

DROP TABLE IF EXISTS `lprequestworksheetchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lprequestworksheetchange` (
  `LPRequestWorksheetChangeID` char(38) NOT NULL DEFAULT '',
  `LPAssignmentHeaderID` char(38) DEFAULT NULL,
  `CurrentDOW` varchar(50) DEFAULT NULL,
  `CurrentWSCount` int(11) DEFAULT NULL,
  `NewWSCount` int(11) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`LPRequestWorksheetChangeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpworksheetassignment`
--

DROP TABLE IF EXISTS `lpworksheetassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpworksheetassignment` (
  `LPWorkSheetAssignmentID` char(38) NOT NULL DEFAULT '',
  `LPAssignmentHeaderID` char(38) DEFAULT NULL,
  `StudentID` char(38) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `WorkType` varchar(50) DEFAULT NULL,
  `DayOfWeek` varchar(50) DEFAULT NULL,
  `NoOfWS` int(11) DEFAULT NULL,
  `Note` varchar(2000) DEFAULT NULL,
  `IsPermanent` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`LPWorkSheetAssignmentID`),
  KEY `StudentID` (`StudentID`),
  KEY `LPAssignmentHeaderID` (`LPAssignmentHeaderID`),
  CONSTRAINT `lpworksheetassignment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `lpworksheetassignment_ibfk_2` FOREIGN KEY (`LPAssignmentHeaderID`) REFERENCES `lpassignmentheader` (`LPAssignmentHeaderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpwsmoverequest`
--

DROP TABLE IF EXISTS `lpwsmoverequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpwsmoverequest` (
  `lpwsmoverequestid` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) DEFAULT NULL,
  `Level` varchar(10) DEFAULT NULL,
  `WorkSheetNo` int(11) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lpwsmoverequestid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgblocklist`
--

DROP TABLE IF EXISTS `msgblocklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgblocklist` (
  `EmailId` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgconfig`
--

DROP TABLE IF EXISTS `msgconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgconfig` (
  `MsgConfigId` char(38) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `UserPass` varchar(50) NOT NULL,
  `UserNick` varchar(50) NOT NULL,
  `ServerDetails` text,
  `ServerPort` varchar(10) DEFAULT NULL,
  `SSLReq` varchar(10) DEFAULT NULL,
  `TLSReq` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MsgConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msginbox`
--

DROP TABLE IF EXISTS `msginbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msginbox` (
  `msgId` char(38) NOT NULL,
  `MsgEngine` varchar(10) NOT NULL,
  `MsgFrom` varchar(200) NOT NULL,
  `MsgFromMobile` varchar(15) DEFAULT NULL,
  `MsgTo` varchar(200) NOT NULL,
  `MsgToMobile` varchar(15) DEFAULT NULL,
  `MsgText` text NOT NULL,
  `MsgDate` datetime DEFAULT NULL,
  `MsgRead` bit(1) NOT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgoutbox`
--

DROP TABLE IF EXISTS `msgoutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgoutbox` (
  `MsgId` char(38) NOT NULL,
  `MsgEngine` varchar(50) NOT NULL,
  `MsgFrom` varchar(200) NOT NULL,
  `MsgFromMobile` varchar(15) DEFAULT NULL,
  `MsgTo` varchar(200) DEFAULT NULL,
  `MsgToMobile` varchar(15) DEFAULT NULL,
  `MsgSubject` text,
  `MsgText` text,
  `MsgHTML` bit(1) DEFAULT NULL,
  `MsgDate` datetime DEFAULT NULL,
  `IsSent` bit(1) DEFAULT b'0',
  `filepath` text,
  `Error` text,
  PRIMARY KEY (`MsgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgsent`
--

DROP TABLE IF EXISTS `msgsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgsent` (
  `MsgId` char(38) NOT NULL,
  `MsgEngine` varchar(50) NOT NULL,
  `MsgFrom` varchar(200) NOT NULL,
  `MsgTo` varchar(200) NOT NULL,
  `MsgToMobile` varchar(15) DEFAULT NULL,
  `MsgSubject` text,
  `MsgText` text,
  `MsgHtml` bit(1) NOT NULL,
  `MsgDate` datetime NOT NULL,
  PRIMARY KEY (`MsgId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `NoteID` char(38) NOT NULL,
  `NoteType` varchar(50) NOT NULL,
  `NoteTitle` varchar(100) DEFAULT NULL,
  `NoteText` text NOT NULL,
  `EntityType` varchar(50) NOT NULL,
  `EntityID` char(38) NOT NULL,
  `IsFlag` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`NoteID`,`EntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `ParentID` char(38) NOT NULL,
  `ParentType` varchar(50) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) NOT NULL,
  `Suffix` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) NOT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `Industry` varchar(50) DEFAULT NULL,
  `ProfilePicture` varchar(500) DEFAULT NULL,
  `IsPickup` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `IDType` varchar(50) DEFAULT NULL,
  `IDNumber` varchar(50) DEFAULT NULL,
  `IsEmergency` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parentstudent`
--

DROP TABLE IF EXISTS `parentstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentstudent` (
  `ParentStudentID` char(38) NOT NULL,
  `ParentID` char(38) NOT NULL,
  `StudentID` char(38) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ParentStudentID`),
  KEY `ParentID` (`ParentID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `parentstudent_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`),
  CONSTRAINT `parentstudent_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `PhoneID` char(38) NOT NULL,
  `EntityType` varchar(50) NOT NULL,
  `EntityID` char(38) NOT NULL,
  `PhoneType` varchar(50) NOT NULL,
  `CountryCode` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(6) DEFAULT NULL,
  `PhoneNum` varchar(10) NOT NULL,
  `Ext` varchar(6) DEFAULT NULL,
  `IsPreferred` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PhoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requestfeedbackconcept`
--

DROP TABLE IF EXISTS `requestfeedbackconcept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestfeedbackconcept` (
  `RequestFeedbackConceptID` char(38) NOT NULL DEFAULT '',
  `LPAssignmentHeaderID` char(38) DEFAULT NULL,
  `ConceptID` char(38) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`RequestFeedbackConceptID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requestparentnote`
--

DROP TABLE IF EXISTS `requestparentnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestparentnote` (
  `RequestParentNoteID` char(38) NOT NULL,
  `LPAssignmentHeaderID` char(38) NOT NULL,
  `Note` text NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`RequestParentNoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requestparentnoteresponse`
--

DROP TABLE IF EXISTS `requestparentnoteresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestparentnoteresponse` (
  `RequestParentNoteResponseID` char(38) NOT NULL,
  `RequestParentNoteID` char(38) NOT NULL,
  `ResponseDate` datetime NOT NULL,
  `ResponseNote` text NOT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`RequestParentNoteResponseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `securityuser`
--

DROP TABLE IF EXISTS `securityuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securityuser` (
  `SecurityUserID` char(38) NOT NULL,
  `LoginID` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `LastLoginTimestamp` datetime DEFAULT NULL,
  `LastLoginIPAddress` varchar(70) DEFAULT NULL,
  `LastLoginMACAddress` varchar(48) DEFAULT NULL,
  `NumberOfPWAttempt` int(11) NOT NULL,
  `Token` varchar(100) DEFAULT NULL,
  `IsForceChangePW` bit(1) NOT NULL DEFAULT b'0',
  `PWExpDate` datetime DEFAULT NULL,
  `TempPassword` varchar(100) DEFAULT NULL,
  `EntityType` varchar(50) DEFAULT NULL,
  `EntityID` char(38) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SecurityUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot` (
  `SlotID` char(38) NOT NULL DEFAULT '',
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `SeqNo` int(11) DEFAULT '10',
  `CreatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`SlotID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `StaffID` char(38) NOT NULL,
  `StaffType` varchar(50) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) NOT NULL,
  `Suffix` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) NOT NULL,
  `ProfilePicture` varchar(500) DEFAULT NULL,
  `IDType` varchar(50) DEFAULT NULL,
  `IDNumber` varchar(50) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffassignment`
--

DROP TABLE IF EXISTS `staffassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffassignment` (
  `StaffAssignmentID` char(38) NOT NULL,
  `StaffID` char(38) NOT NULL,
  `StaffType` varchar(50) NOT NULL,
  `Date` datetime NOT NULL,
  `SlotID` char(38) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StaffAssignmentID`),
  KEY `StaffID` (`StaffID`),
  CONSTRAINT `staffassignment_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffassignmenttemplate`
--

DROP TABLE IF EXISTS `staffassignmenttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffassignmenttemplate` (
  `StaffAssignmentID` char(38) NOT NULL,
  `DayOfWeek` varchar(50) NOT NULL,
  `SlotID` char(38) NOT NULL,
  `StaffID` char(38) NOT NULL,
  `StaffType` varchar(50) NOT NULL,
  `IsPermanent` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`StaffAssignmentID`),
  KEY `SlotID` (`SlotID`),
  KEY `StaffID` (`StaffID`),
  CONSTRAINT `staffassignmenttemplate_ibfk_1` FOREIGN KEY (`SlotID`) REFERENCES `slot` (`SlotID`),
  CONSTRAINT `staffassignmenttemplate_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffslotassignmentrequest`
--

DROP TABLE IF EXISTS `staffslotassignmentrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffslotassignmentrequest` (
  `StaffSlotAssignmentRequestID` char(38) NOT NULL,
  `RequestDate` datetime NOT NULL,
  `StaffID` char(38) NOT NULL,
  `IsPermanent` bit(1) NOT NULL DEFAULT b'0',
  `RequestStartDate` datetime NOT NULL,
  `RequestEndDate` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `Createdby` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`StaffSlotAssignmentRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staffslotassignmentrequestdetail`
--

DROP TABLE IF EXISTS `staffslotassignmentrequestdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffslotassignmentrequestdetail` (
  `StaffSlotAssignmentRequestDetailID` char(38) NOT NULL,
  `StaffSlotAssignmentRequestID` char(38) NOT NULL,
  `RequestType` varchar(50) NOT NULL,
  `DayOfWeek` varchar(50) NOT NULL,
  `SlotID` char(38) NOT NULL,
  `StaffAssignmentID` char(38) DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`StaffSlotAssignmentRequestDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stringmap`
--

DROP TABLE IF EXISTS `stringmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stringmap` (
  `StringMapID` char(38) NOT NULL,
  `StringMapType` varchar(25) NOT NULL,
  `StringMapName` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `SortOrder` int(11) NOT NULL,
  `ParentStringMapID` char(38) DEFAULT NULL,
  `IsSystemCode` bit(1) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StringMapID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StudentID` char(38) NOT NULL DEFAULT '',
  `StudentCode` varchar(50) DEFAULT NULL,
  `StudentCodePrefix` char(5) DEFAULT NULL,
  `StudentCodeNumber` int(11) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Suffix` varchar(50) DEFAULT NULL,
  `Gender` char(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `School` varchar(50) DEFAULT NULL,
  `Grade` varchar(50) DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `LeavingDate` date DEFAULT NULL,
  `ProfilePicture` varchar(500) DEFAULT NULL,
  `StudentStatus` varchar(50) DEFAULT NULL,
  `AcademicProf` varchar(2000) DEFAULT NULL,
  `BehaviourProf` varchar(2000) DEFAULT NULL,
  `LikesProf` varchar(2000) DEFAULT NULL,
  `DislikesProf` varchar(2000) DEFAULT NULL,
  `StrengthProf` varchar(2000) DEFAULT NULL,
  `AreaOfInterestProf` varchar(2000) DEFAULT NULL,
  `SpecialRequestProf` varchar(2000) DEFAULT NULL,
  `StaffCommentsProf` varchar(2000) DEFAULT NULL,
  `ParentCommentsProf` varchar(2000) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentassignmenttemplate`
--

DROP TABLE IF EXISTS `studentassignmenttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentassignmenttemplate` (
  `StudentAssignmentID` char(38) NOT NULL,
  `DayOfWeek` varchar(50) NOT NULL,
  `SlotID` char(38) NOT NULL,
  `StudentID` char(38) NOT NULL,
  `IsPermanent` bit(1) NOT NULL DEFAULT b'0',
  `Subject` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentAssignmentID`),
  KEY `SlotID` (`SlotID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `studentassignmenttemplate_ibfk_1` FOREIGN KEY (`SlotID`) REFERENCES `slot` (`SlotID`),
  CONSTRAINT `studentassignmenttemplate_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentcenterslot`
--

DROP TABLE IF EXISTS `studentcenterslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentcenterslot` (
  `StudentCenterSlotID` char(38) NOT NULL DEFAULT '',
  `StudentID` char(38) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `SlotID` char(38) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `IsPresent` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`StudentCenterSlotID`),
  KEY `SlotID` (`SlotID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentprofile`
--

DROP TABLE IF EXISTS `studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentprofile` (
  `StudentProfileID` char(38) NOT NULL,
  `Academic` bit(1) DEFAULT NULL,
  `Behaviour` bit(1) DEFAULT NULL,
  `Likes` bit(1) DEFAULT NULL,
  `Dislikes` bit(1) DEFAULT NULL,
  `Strength` bit(1) DEFAULT NULL,
  `AreaOfInterest` bit(1) DEFAULT NULL,
  `SpecialRequest` bit(1) DEFAULT NULL,
  `StaffComment` bit(1) DEFAULT NULL,
  `ParentComment` bit(1) DEFAULT NULL,
  `StudentID` char(38) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentslotassignmentrequest`
--

DROP TABLE IF EXISTS `studentslotassignmentrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentslotassignmentrequest` (
  `StudentSlotAssignmentRequestID` char(38) NOT NULL,
  `RequestDate` datetime NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `StudentID` char(38) NOT NULL,
  `IsPermanent` bit(1) NOT NULL,
  `RequestStartDate` datetime NOT NULL,
  `RequestEndDate` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentSlotAssignmentRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentslotassignmentrequestdetail`
--

DROP TABLE IF EXISTS `studentslotassignmentrequestdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentslotassignmentrequestdetail` (
  `StudentSlotAssignmentRequestDetailID` char(38) NOT NULL,
  `StudentSlotAssignmentRequestID` char(38) NOT NULL,
  `RequestType` varchar(50) NOT NULL,
  `DayOfWeek` varchar(50) DEFAULT NULL,
  `SlotID` char(38) DEFAULT NULL,
  `StudentAssignmentID` char(38) DEFAULT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`StudentSlotAssignmentRequestDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentsubjectlevel`
--

DROP TABLE IF EXISTS `studentsubjectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentsubjectlevel` (
  `StudentSubjectLevelID` char(38) NOT NULL DEFAULT '',
  `LPAssignmentHeaderID` char(38) DEFAULT NULL,
  `StudentID` char(38) DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `WSStartNo` int(11) DEFAULT NULL,
  `WSEndNo` int(11) DEFAULT NULL,
  `WSStartDate` datetime DEFAULT NULL,
  `WSEndDate` datetime DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentSubjectLevelID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `studentsubjectlevel_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysparam`
--

DROP TABLE IF EXISTS `sysparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysparam` (
  `SysParamId` varchar(38) NOT NULL DEFAULT 'UUID()',
  `ParamType` varchar(50) NOT NULL,
  `ParamName` varchar(100) NOT NULL,
  `Value` varchar(100) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  `CreatedBy` varbinary(38) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedBy` varchar(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`SysParamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_debug`
--

DROP TABLE IF EXISTS `tmp_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_debug` (
  `RecordId` int(11) NOT NULL AUTO_INCREMENT,
  `DTMLog` datetime NOT NULL,
  `Message` text,
  PRIMARY KEY (`RecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmpdebug`
--

DROP TABLE IF EXISTS `tmpdebug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmpdebug` (
  `Date` datetime DEFAULT NULL,
  `Message` text,
  `ExtraData` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useractivitylog`
--

DROP TABLE IF EXISTS `useractivitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useractivitylog` (
  `UserActivityLogID` char(38) NOT NULL,
  `SecurityUserID` char(38) NOT NULL,
  `LoginTimestamp` datetime NOT NULL,
  `LoginIPAddress` varchar(70) DEFAULT NULL,
  `LoginMACAddress` varchar(48) DEFAULT NULL,
  `LogOutTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`UserActivityLogID`),
  KEY `SecurityUserID` (`SecurityUserID`),
  CONSTRAINT `useractivitylog_ibfk_1` FOREIGN KEY (`SecurityUserID`) REFERENCES `securityuser` (`SecurityUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workingdaydetail`
--

DROP TABLE IF EXISTS `workingdaydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workingdaydetail` (
  `WorkingDayDetailID` char(38) NOT NULL,
  `WorkingDayID` char(38) DEFAULT NULL,
  `FromTime` time DEFAULT NULL,
  `ToTime` time DEFAULT NULL,
  `IsClosed` bit(1) DEFAULT b'0',
  `CreatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(38) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`WorkingDayDetailID`),
  KEY `fk_WorkingDayID` (`WorkingDayID`),
  CONSTRAINT `workingdaydetail_ibfk_1` FOREIGN KEY (`WorkingDayID`) REFERENCES `workingdayheader` (`WorkingDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workingdayheader`
--

DROP TABLE IF EXISTS `workingdayheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workingdayheader` (
  `WorkingDayID` char(38) NOT NULL,
  `WorkingDayName` varchar(50) DEFAULT NULL,
  `CreatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`WorkingDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worksheetscore`
--

DROP TABLE IF EXISTS `worksheetscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worksheetscore` (
  `WorksheetScoreID` char(38) NOT NULL,
  `StudentID` char(38) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Level` varchar(50) NOT NULL,
  `WorksheetNum` int(11) NOT NULL,
  `WorksheetDate` date NOT NULL,
  `Score` decimal(5,2) NOT NULL,
  `TimeTakenInSeconds` int(11) DEFAULT NULL,
  `IsIncomplete` bit(1) NOT NULL DEFAULT b'0',
  `IsPickedUp` bit(1) NOT NULL DEFAULT b'0',
  `IsDropped` bit(1) NOT NULL DEFAULT b'0',
  `PickupDate` datetime DEFAULT NULL,
  `DropDate` datetime DEFAULT NULL,
  `IsFixed` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `LessonPlanScoreAssignmentID` char(38) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`WorksheetScoreID`),
  KEY `StudentID` (`StudentID`),
  KEY `fk_LessonPlanScoreAssignmentID` (`LessonPlanScoreAssignmentID`),
  CONSTRAINT `worksheetscore_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `worksheetscore_ibfk_2` FOREIGN KEY (`LessonPlanScoreAssignmentID`) REFERENCES `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `x_centerday`
--

DROP TABLE IF EXISTS `x_centerday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_centerday` (
  `CenterDayID` char(38) NOT NULL,
  `CenterDayName` varchar(100) NOT NULL,
  `SeqNo` int(11) DEFAULT '10',
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CenterDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `x_lpassignment`
--

DROP TABLE IF EXISTS `x_lpassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_lpassignment` (
  `LPAssignmentID` char(38) NOT NULL,
  `StudentID` char(38) NOT NULL,
  `PlacementTestDate` datetime DEFAULT NULL,
  `Subject` varchar(50) NOT NULL,
  `PlacementTestLevel` varchar(50) DEFAULT NULL,
  `StartingLevel` varchar(50) NOT NULL,
  `PlacementTestScore` decimal(5,2) DEFAULT NULL,
  `StartingWorkSheetNum` int(11) NOT NULL,
  `WSStartDate` datetime NOT NULL,
  `CreatedBy` char(38) NOT NULL,
  `UpdatedBy` char(38) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Active',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`LPAssignmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'lcmdev'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAbsentData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetAbsentData`(
  IN LPAssignmentHeaderID        char(38)  
)
BEGIN
  
  

SELECT 
LP.RequestStartDate,
LP.RequestEndDate,
LP.ReasonCode,
LP.ReasonOther, 
LP.RequestType,
LP.Subject,
LA.RequestOption,
LA.PickupDateTime,
LA.PickUpTime,
LA.PickupPersonID,
LA.PickupPersonOther,
LA.MakupDate,
LA.MakupSlotID,
P.ParentType
FROM lpassignmentheader LP 
LEFT JOIN lprequestabsent LA ON LA.LPAssignmentHeaderID = LP.LPAssignmentHeaderID
Left join parent P On P.ParentID = LA.PickupPersonID
WHERE LP.LPAssignmentHeaderID=LPAssignmentHeaderID;

 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCommonData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetCommonData`(
  IN LPAssignmentHeaderID        char(38)  
)
BEGIN
  
SELECT LP.Status,LP.RequestDate,LP.ApprovalDate,'Admin' AS ApproveBy,
CASE WHEN SU.EntityType='Admin' THEN 'Admin' ELSE CONCAT(p.FirstName," ",p.LastName) END AS CreatedBy,
CASE WHEN SU2.EntityType='Admin' THEN 'Admin' ELSE CONCAT(p2.FirstName," ",p2.LastName) END AS StatusBy,
CONCAT(p3.FirstName," ",p3.LastName) AS RequestedBy
FROM lpassignmentheader LP
LEFT JOIN securityuser SU ON SU.SecurityUserID = LP.CreatedBy
LEFT JOIN parent p ON p.parentID = SU.EntityId
LEFT JOIN securityuser SU2 ON SU2.SecurityUserID = LP.StatusBy
LEFT JOIN parent p2 ON p2.parentID = SU2.EntityId
LEFT JOIN parent p3 ON p3.parentID = LP.CreatedBy
WHERE LP.LPAssignmentHeaderID= LPAssignmentHeaderID;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRequestListByFilter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetRequestListByFilter`(
 IN vStartDate DATE,
 IN vEndDate DATE,
 IN vRequestType VARCHAR(50),
 IN vType VARCHAR(50),
 IN vUserId CHAR(38)
)
BEGIN
	IF(vType = 'All') THEN
		BEGIN
			SELECT lah.LPAssignmentHeaderID,lah.Subject,DATE_FORMAT(lah.RequestDate,"%m/%d/%Y") RequestDate,s.StudentID,CONCAT(s.StudentCodePrefix,LPAD(s.StudentCodeNumber,4,"0") )AS StudentCode,CONCAT(s.FirstName," ",s.LastName) NAME,su.EntityType,lah.Status,
			CASE 
				WHEN lah.RequestType= "Upgrade" THEN  "Upgrade Level" 
				WHEN lah.RequestType = "Downgrade" THEN "Make Easier Level" 
				ELSE lah.RequestType 
			END AS RequestType,
            CASE WHEN SU2.EntityType='Admin' THEN 'Admin' ELSE CONCAT(p2.FirstName," ",p2.LastName) END AS StatusBy
			FROM lpassignmentheader  lah
			LEFT JOIN student s ON s.StudentID = lah.StudentID
			LEFT JOIN securityuser su ON su.SecurityUserID = lah.SubmittedBy
            LEFT JOIN securityuser SU2 ON SU2.SecurityUserID = LP.StatusBy
			LEFT JOIN parent p2 ON p2.parentID = SU2.EntityId
			WHERE (DATE(lah.RequestDate) >= vStartDate OR vStartDate IS NULL )
			AND (DATE(lah.RequestDate) <= vEndDate OR vEndDate IS NULL )
			AND (lah.RequestType = vRequestType OR (vRequestType='' OR vRequestType IS NULL))
			ORDER BY lah.RequestDate;
		END;
	END IF;
	
	IF(vType = 'Parent') THEN
		BEGIN
			SELECT su.SecurityUserID,lah.LPAssignmentHeaderID,lah.Subject,DATE_FORMAT(lah.RequestDate,"%m/%d/%Y") RequestDate,s.StudentID,
			CONCAT(s.StudentCodePrefix,LPAD(s.StudentCodeNumber,4,"0") )AS StudentCode, CONCAT(s.FirstName," ",s.LastName) NAME,
			CONCAT(p.FirstName," ",p.LastName)EntityType,lah.Status,lah.RequestType,
            CASE WHEN SU2.EntityType='Admin' THEN 'Admin' ELSE CONCAT(p2.FirstName," ",p2.LastName) END AS StatusBy
			FROM lpassignmentheader  lah 
			LEFT JOIN student s ON s.StudentID = lah.StudentID
			LEFT JOIN parentstudent ON parentstudent.StudentId = s.StudentID
			LEFT JOIN parent p ON p.parentID = parentstudent.parentID
			LEFT JOIN securityuser su ON su.EntityId = p.parentID
			LEFT JOIN securityuser SU2 ON SU2.SecurityUserID = LP.StatusBy
			LEFT JOIN parent p2 ON p2.parentID = SU2.EntityId
			WHERE su.SecurityUserID= vUserId
			AND (DATE(lah.RequestDate) >= vStartDate OR vStartDate IS NULL )
			AND (DATE(lah.RequestDate) <= vEndDate OR vEndDate IS NULL )
			AND (lah.RequestType = vRequestType OR (vRequestType='' OR vRequestType IS NULL))
			ORDER BY lah.RequestDate;
		END;
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSlotDetailByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetSlotDetailByDate`(
  IN SlotDate     DATE
)
BEGIN
  /* Declare local variables here */ 

  /* Initilize the local varibale data here */
     
     SELECT  studentcenterslot.Date,studentcenterslot.StudentCenterSlotID,studentcenterslot.StudentID,studentcenterslot.Subject,
     studentcenterslot.SlotID,slot.StartTime,slot.EndTime,
     student.Firstname,student.LastName,student.StudentCode,student.ProfilePicture
     FROM studentcenterslot 
     INNER JOIN student ON student.StudentID = studentcenterslot.StudentID 
     INNER JOIN slot ON slot.SlotID = studentcenterslot.SlotID
     -- JOIN StaffAssignment  SA ON studentcenterslot.SlotId = SA.SlotId AND 
          --                         studentcenterslot.Date   = SA.Date
     WHERE studentcenterslot.Status = 'Active' AND student.Status = 'Active' and studentcenterslot.Date = SlotDate ORDER BY SeqNo ASC;
     
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSlotDetailByDateSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetSlotDetailByDateSubject`(
 IN vselectedDate     DATE,
    IN vsubject        VARCHAR(50)
)
BEGIN


SELECT SL.`SlotID`, SL.`StartTime`, SL.`EndTime`, SS.Students, SS.AvailableSlots FROM `slot` SL
LEFT JOIN (SELECT S.SlotId,  S.StartTime, S.EndTime,  COUNT(SC.StudentId) AS Students,
           (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) - COUNT(SC.StudentCenterSlotId)) AS AvailableSlots
          FROM studentcenterslot SC
       JOIN `slot`              S ON S.SlotId = SC.SlotId
     LEFT JOIN staffassignment  SA ON SC.SlotId = SA.SlotId 
     WHERE  SA.Status = 'Active' AND SC.Status = 'Active' AND CAST(SC.Date AS DATE) = vselectedDate AND 
            SC.Subject = vsubject
     GROUP BY SC.Date, S.SlotId, S.StartTime, S.EndTime) SS ON SS.SlotId = SL.`SlotID`
     ORDER BY SL.StartTime;
	
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSlotListWithStaffCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetSlotListWithStaffCount`(
     IN vDate     DATE    
    )
BEGIN
		     
		SELECT DISTINCT S.`SlotID`, s.StartTime, s.EndTime, ttS.Date, ttS.Staffs, ttS.AvailableSlots
		FROM `slot` S
		 LEFT JOIN (
		 SELECT S.StartTime, S.EndTime, S.SlotId, SA.Date, COUNT(SA.StaffAssignmentID) AS Staffs,
			    SUM(CASE WHEN SA.StaffType = 'Tutor'  THEN 4 ELSE 0 END) AS TotalSlots,
			    (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) -COUNT(SA.StaffAssignmentID)) AS AvailableSlots
		     FROM  staffassignment  SA 
		       JOIN `slot`              S ON S.SlotId = SA.SlotId
		       JOIN studentcenterslot SC ON SC.SlotId = SA.SlotId AND 
						   SC.Date   = SA.Date
		     WHERE  SA.Status = 'Active' AND SC.Status = 'Active' AND CAST(SA.Date AS DATE)  = vDate 
		     GROUP BY SA.Date, S.SlotId, S.StartTime, S.EndTime) tts ON tts.slotID = S.slotID;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSlotListWithStudentCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetSlotListWithStudentCount`(
     IN vDate     DATE    
    )
BEGIN

		SELECT DISTINCT S.SeqNo,S.`SlotID`, s.StartTime, s.EndTime, ttS.Date, ttS.Students, ttS.AvailableSlots
		FROM `slot` S
		 LEFT JOIN (
		 SELECT S.StartTime, S.EndTime, S.SlotId, SC.Date, COUNT(SC.StudentCenterSlotId) AS Students,
			    SUM(CASE WHEN SA.StaffType = 'Tutor'  THEN 4 ELSE 0 END) AS TotalSlots,
			    (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) -COUNT(SC.StudentCenterSlotId)) AS AvailableSlots
		     FROM studentcenterslot SC
		       JOIN `slot`              S ON S.SlotId = SC.SlotId
		       JOIN staffassignment  SA ON SC.SlotId = SA.SlotId AND 
						   SC.Date   = SA.Date
		     WHERE  SA.Status = 'Active' AND SC.Status = 'Active' AND CAST(SC.Date AS DATE)  = vDate 
		     GROUP BY SC.Date, S.SlotId, S.StartTime, S.EndTime) tts ON tts.slotID = S.slotID  ORDER BY S.SeqNo;



	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStaffDetailByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStaffDetailByDate`(
     IN SlotDate     DATE)
BEGIN
	SELECT Distinct staff.StaffID,staff.StaffType,staff.Title,staff.FirstName,staff.MiddleName,studentcenterslot.SlotID
	 FROM staffassignment 
	INNER JOIN staff ON staff.StaffID = staffassignment.StaffID
	INNER JOIN studentcenterslot ON studentcenterslot.SlotID = staffassignment.SlotID
	WHERE studentcenterslot.Date = SlotDate;
	
	
	
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStaffSlotData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStaffSlotData`(
  IN vAction        VARCHAR(50),
  IN vStartDate     DATE
)
BEGIN
  
  /* Declare local variables here */
  DECLARE vvStartDate  DATE;
  DECLARE vvEndDate    DATE;
  /* Initilize the local varibale data here */
  
  IF (vAction = 'Monthly') THEN
    BEGIN
     
     SELECT DATE_ADD(DATE_ADD(LAST_DAY(vStartDate),INTERVAL 1 DAY),INTERVAL -1 MONTH) INTO vvStartDate;    
     SELECT LAST_DAY(vStartDate) INTO vvEndDate;
     
     
     SELECT S.StartTime, S.EndTime, S.SlotId, SA.Date, COUNT(SA.StaffAssignmentID) AS Staffs,
            SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) AS TotalSlots,
            (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) - COUNT(SA.StaffAssignmentID)) AS AvailableSlots
     FROM `staffassignment` SA 
     JOIN studentcenterslot SC ON SC.SlotId = SA.SlotId AND  CAST(SC.Date AS DATE)   = CAST(SA.Date AS DATE)
      JOIN `slot`              S ON S.SlotId = SA.SlotId
       
     WHERE  CAST(SA.Date AS DATE) BETWEEN vvStartDate AND vvEndDate 
     GROUP BY SA.Date, S.SlotId, S.StartTime, S.EndTime
     ORDER BY SA.Date, S.StartTime;
    
     
     END; 
     END IF;
   
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStaffSlotDetailByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStaffSlotDetailByDate`(
  IN SlotDate     DATE
)
BEGIN
  /* Declare local variables here */ 

  /* Initilize the local varibale data here */
  
  
  SELECT SA.StaffAssignmentID,SA.StaffID,
     SA.SlotID,slot.StartTime,slot.EndTime,
     sf.Firstname,sf.LastName,sf.IDNumber,sf.IDType,sf.ProfilePicture
     FROM `staffassignment` SA 
     INNER JOIN staff  sf ON sf.StaffID = SA.StaffID 
    INNER JOIN slot ON slot.SlotID = SA.SlotID
     WHERE SA.Status = 'Active' AND sf.Status = 'Active'  AND SA.Date = SlotDate ORDER BY SeqNo ASC;
     
     
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStudentById`(
  IN vStudentID        char(38)  
)
BEGIN
  
SELECT s.StudentID, s.FirstName, 
s.MiddleName, s.LastName,
s.StudentCodePrefix,s.StudentCodeNumber,
CONCAT(s.StudentCodePrefix,LPAD(StudentCodeNumber,4,"0") )AS StudentCode, 
s.JoiningDate, s.ProfilePicture, sm.description DisplayGrade, 
s.Title, s.Suffix, s.Gender, s.DOB, s.School,
s.Grade, s.LeavingDate ,
E.Email,
PN.PhoneNum,
PN.Ext,
math.LEVEL AS 'MathLevel',
Reading.LEVEL AS 'ReadingLevel'
FROM student s 
LEFT JOIN stringmap sm ON sm.stringmapname = s.Grade
LEFT JOIN parentstudent PS ON  PS.StudentID = s.StudentID
LEFT JOIN parent P ON P.ParentID = PS.ParentID AND P.parentType = 'Mother'
LEFT JOIN email E ON E.EntityID = P.ParentID AND E.IsPreferred = 1
LEFT JOIN phone PN ON PN.EntityID = P.ParentID AND PN.IsPreferred = 1

LEFT JOIN (

SELECT LEVEL,StudentID FROM studentsubjectlevel
WHERE STATUS='Active'
AND SUBJECT='Math'
AND StudentID = vStudentID
ORDER BY createdon DESC LIMIT 1
) AS math ON math.StudentID = s.StudentID


LEFT JOIN (

SELECT LEVEL,StudentID FROM studentsubjectlevel
WHERE STATUS='Active'
AND SUBJECT='Reading'
AND StudentID = vStudentID
ORDER BY createdon DESC LIMIT 1
) AS Reading ON Reading.StudentID = s.StudentID

WHERE s.StudentID =vStudentID;
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentListByFilter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStudentListByFilter`(
 IN Subject varchar(50),
 IN CenterDay VARCHAR(50),
 IN Slot VARCHAR(50),
 IN Grade Varchar(50),
 IN Phone Varchar(50),
 IN Email VARChar(50),
 IN Level VARCHAR(50),
 IN Assignment VARchar(50),
 IN StudentParentID CHAr(38)
)
BEGIN
    
	/*SET @Subject = NULL;*/
	SELECT s1.description Grade, s.StudentID, CONCAT(s.FirstName," ",s.LastName) NAME, 
		DATE_FORMAT(s.JoiningDate, "%m/%e/%Y") JoiningDate, s.StudentCode, p.PhoneNum, e.Email, s.School, 
		GROUP_CONCAT(DISTINCT s2.description SEPARATOR ', ') SUBJECT,
		GROUP_CONCAT(DISTINCT IF(sc.Subject = "Reading",CONCAT(sc.DayOfWeek," ",TIME_FORMAT(sl.StartTime,'%h:%i %p')),NULL) SEPARATOR ', ') englishcenter,
		GROUP_CONCAT(DISTINCT IF(sc.Subject = "Math",CONCAT(sc.DayOfWeek," ",TIME_FORMAT(sl.StartTime,'%h:%i %p')),NULL) SEPARATOR ', ') mathcenter, 
		s.DOB, ssl1.Level mathlevel, ssl3.Level englishlevel
	FROM student s
	LEFT JOIN studentassignmenttemplate sc ON s.StudentID = sc.StudentID
	LEFT JOIN slot sl ON sl.SlotID = sc.SlotID
	LEFT JOIN parentstudent ps ON s.StudentID = ps.StudentID
	LEFT JOIN phone p ON p.EntityID = ps.ParentID AND p.EntityType = "Parent" AND p.Status = "Active" AND NOT EXISTS(SELECT 1 FROM phone phn2 WHERE p.EntityType = phn2.EntityType AND phn2.CreatedOn < p.CreatedOn AND p.EntityID = phn2.EntityID AND phn2.Status = "Active")
	LEFT JOIN email e ON e.EntityID = ps.ParentID AND e.EntityType = "Parent" AND e.Status = "Active" AND NOT EXISTS(SELECT 1 FROM email e2 WHERE e.EntityType = e2.EntityType AND e2.CreatedOn < e.CreatedOn AND e.EntityID = e2.EntityID AND e2.Status = "Active")
	left join lpassignmentheader lp ON lp.StudentID = s.StudentID
	left join studentsubjectlevel ssl1 on ssl1.StudentID = s.StudentID AND ssl1.Status = "Active" AND ssl1.Subject = "Math"
	left join studentsubjectlevel ssl3 on ssl3.StudentID = s.StudentID AND ssl3.Status = "Active" AND ssl3.Subject = "Reading"
	LEFT JOIN stringmap s1 ON s1.stringmapname=s.grade
	LEFT JOIN stringmap s2 ON s2.stringmapname=sc.Subject
	WHERE s.Status = "Active" AND (sc.Subject = SUBJECT OR (SUBJECT IS NULL OR SUBJECT = "All")) 
	      AND (sc.DayOfWeek = CenterDay OR (CenterDay IS NULL OR CenterDay="All")) 
	      AND (sc.SlotID = Slot OR Slot IS NULL) AND (s.Grade = Grade OR Grade IS NULL) 
	      AND (p.PhoneNum LIKE CONCAT('%', Phone, '%') OR Phone IS NULL) 
	      AND (e.Email LIKE CONCAT('%', Email, '%') OR Email IS NULL) 
	      AND (s.StudentID = StudentParentID OR (ps.ParentID = StudentParentID) OR (StudentParentID is null))
	       AND (ssl1.Level = LEVEL OR (ssl3.Level = LEVEL) OR (LEVEL = '' OR level is null))
	AND case  
	   when Assignment = "CenterSlot" then sc.StudentID is null
	   when Assignment = "LessonPlan" THEN lp.StudentID IS NULL
	   else s.StudentID = s.StudentID
	END	
	GROUP BY s.StudentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentListBySlot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStudentListBySlot`(
    IN vSlotID     CHAR(38)  ,
     IN vSlotDate     DATE  ,
     IN vSubject     Varchar(50)
    )
BEGIN
     SELECT studentcenterslot.Date,studentcenterslot.StudentCenterSlotID,studentcenterslot.StudentID,studentcenterslot.Subject,
     studentcenterslot.SlotID,
     student.Firstname,student.LastName,student.StudentCode,student.ProfilePicture
     FROM studentcenterslot 
     INNER JOIN student ON student.StudentID = studentcenterslot.StudentID 
     WHERE studentcenterslot.Status = 'Active' AND student.Status = 'Active' AND studentcenterslot.Date = vSlotDate 
     AND studentcenterslot.Subject = vSubject 
     AND  studentcenterslot.SlotID = vSlotID;
   
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentSlotData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStudentSlotData`(
  IN vAction        VARCHAR(50),
  IN vStartDate     DATE
)
BEGIN
  
  /* Declare local variables here */
  DECLARE vvStartDate  DATE;
  DECLARE vvEndDate    DATE;
  /* Initilize the local varibale data here */
  
  /* Weekly data block */
  IF (vAction = 'Weekly') THEN
     BEGIN
     
     SELECT DATE_ADD(vStartDate, INTERVAL(2-DAYOFWEEK(vStartDate)) DAY) INTO vvStartDate;
     SELECT DATE_ADD(vStartDate, INTERVAL(7-DAYOFWEEK(vStartDate)) DAY) INTO vvEndDate;   
    
     
     SELECT S.StartTime, S.EndTime, S.SlotId, SC.Date, COUNT(SC.StudentCenterSlotId) AS Students,
            sum(case when SA.StaffType = 'Tutor' then 4 else 0 end) as TotalSlots,
            (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 end) -COUNT(SC.StudentCenterSlotId)) as AvailableSlots
     FROM studentcenterslot SC
       JOIN `slot`              S ON S.SlotId = SC.SlotId
       Join `staffassignment`  SA on SC.SlotId = SA.SlotId and 
                                   SC.Date   = SA.Date
     WHERE  CAST(SC.Date AS DATE) BETWEEN vvStartDate AND vvEndDate 
     GROUP BY SC.Date, S.SlotId, S.SeqNo ,S.StartTime, S.EndTime
     ORDER BY SC.Date, S.StartTime;
     END;
     END IF;  
  
  /* Weekly data block */
  IF (vAction = 'Monthly') THEN
    BEGIN
     
     SELECT DATE_ADD(DATE_ADD(LAST_DAY(vStartDate),INTERVAL 1 DAY),INTERVAL -1 MONTH) INTO vvStartDate;    
     SELECT LAST_DAY(vStartDate) INTO vvEndDate;
     
    
     SELECT S.StartTime, S.EndTime, S.SlotId, SC.Date, COUNT(SC.StudentCenterSlotId) AS Students,
            sum(case when SA.StaffType = 'Tutor' then 4 else 0 end) as TotalSlots,
            (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) -COUNT(SC.StudentCenterSlotId)) AS AvailableSlots
     FROM studentcenterslot SC
       JOIN `slot`              S ON S.SlotId = SC.SlotId
       Join `staffassignment`  SA on SC.SlotId = SA.SlotId AND 
                                  CAST(SC.Date AS DATE)   = CAST(SA.Date AS DATE)
     WHERE  CAST(SC.Date AS DATE) BETWEEN vvStartDate AND vvEndDate 
     GROUP BY SC.Date, S.SlotId,  S.SeqNo,S.StartTime, S.EndTime
     ORDER BY SC.Date, S.StartTime;
     
     END; 
     END IF;
   
    /* Weekly data block */ 
    IF (vAction = 'Yearly') THEN
      BEGIN
    
      SELECT CONCAT(YEAR(vStartDate), '-01-01') INTO vvStartDate;    
      SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vvEndDate;
     
    
     SELECT S.StartTime, S.EndTime, S.SlotId, SC.Date, COUNT(SC.StudentCenterSlotId) AS Students,
            sum(case when SA.StaffType = 'Tutor' then 4 else 0 end) as TotalSlots,
            (SUM(CASE WHEN SA.StaffType = 'Tutor' THEN 4 ELSE 0 END) -COUNT(SC.StudentCenterSlotId)) AS AvailableSlots
     FROM studentcenterslot SC
       JOIN `slot`              S ON S.SlotId = SC.SlotId
       Join `staffassignment`  SA on SC.SlotId = SA.SlotId AND 
                                   SC.Date   = SA.Date
     WHERE  SA.Status = 'Active' AND SC.Status = 'Active' AND CAST(SC.Date AS DATE) BETWEEN vvStartDate AND vvEndDate 
     GROUP BY SC.Date, S.SlotId, S.SeqNo, S.StartTime, S.EndTime
     ORDER BY SC.Date, S.StartTime; 
     END;
     
     END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentWSWithDays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetStudentWSWithDays`(
    IN vSubject  VARCHAR(50),
 IN vStudentID     CHAR(38)    
    )
BEGIN

/*
SELECT * FROM lpworksheetassignment WHERE STATUS = 'Active' AND `LPAssignmentHeaderID` 
= (SELECT lh.LPAssignmentHeaderID FROM `lpassignmentheader` AS lh WHERE lh.StudentID = vStudentID
AND lh.Subject = vSubject AND IsPermanent = '1' ORDER BY CreatedOn DESC LIMIT 1);
*/

SELECT * FROM lpworksheetassignment lwa1 WHERE StudentID = vStudentID AND SUBJECT = vSubject AND IsPermanent = b'1' AND STATUS = 'Active'
AND NOT EXISTS 
( SELECT 1 FROM lpworksheetassignment lwa2 WHERE lwa2.studentid = lwa1.studentid AND lwa2.subject = lwa1.subject AND lwa2.IsPermanent = b'1' AND lwa2.status = 'Active'
   AND lwa2.createdon > lwa1.createdon);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTimeChangeData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetTimeChangeData`(
  IN LPAssignmentHeaderID        char(38)  
)
BEGIN

SELECT 
 LP.RequestStartDate,
 LP.RequestEndDate,
 LP.StudentID,
 LP.Subject,
 LP.RequestType,
 LP.IsPermanent,
 LP.ReasonCode,
 LP.ReasonOther,
 LT.CurrentDOW,
 LT.CurrentSlotId,
 LT.NewDOW,
 LT.NewSlotId,
 CST.StartTime AS CurrentStartTime,
 CST.EndTime AS CurrentEndTime,
 NST.StartTime AS NewStartTime,
 NST.StartTime AS NewEndTime
FROM lpassignmentheader LP
LEFT JOIN lprequesttimechange LT ON LT.LPAssignmentHeaderID = LP.LPAssignmentHeaderID
LEFT JOIN slot CST ON LT.CurrentSlotId = CST.SlotID
LEFT JOIN slot NST ON LT.NewSlotId = NST.SlotID
WHERE LP.LPAssignmentHeaderID = LPAssignmentHeaderID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTypeWiseWorkSheetLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetTypeWiseWorkSheetLevel`(
  IN Subject        VARCHAR(50),
  IN Type        VARCHAR(50),
  IN Level        VARCHAR(50)
  
)
BEGIN
  
   IF (TYPE = 'Higher') THEN
   BEGIN
      
   SELECT * FROM `stringmap` WHERE stringmaptype=SUBJECT AND 
   SortOrder >= (SELECT SortOrder FROM `stringmap` WHERE StringmapName=LEVEL and stringmaptype=SUBJECT)
    ORDER BY sortorder;
    END;
    END IF; 
   
    IF (TYPE = 'Lower') THEN
   BEGIN
      
   SELECT * FROM `stringmap` WHERE stringmaptype=SUBJECT AND 
   SortOrder <= (SELECT SortOrder FROM `stringmap` WHERE StringmapName=LEVEL AND stringmaptype=SUBJECT)
    ORDER BY sortorder DESC;
    END;
 END IF; 
 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetWorkSheetData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `GetWorkSheetData`(
  IN LPAssignmentHeaderID        char(38)  
)
BEGIN

SELECT 
 LP.RequestStartDate,
 LP.RequestEndDate,
 LP.StudentID,
 LP.Subject,
 LP.RequestType,
 LP.IsPermanent,
 LP.ReasonCode,
 LP.ReasonOther,
 LT.CurrentDOW,
 LT.CurrentWSCount,
 LT.NewWSCount
FROM lpassignmentheader LP
LEFT JOIN lprequestworksheetchange LT ON LT.LPAssignmentHeaderID = LP.LPAssignmentHeaderID
WHERE LP.LPAssignmentHeaderID = LPAssignmentHeaderID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listslotbydateSP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `listslotbydateSP`(IN SlotDate DATE)
BEGIN
SET @QueryResult = (SELECT *  FROM slot) ;
	
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentLessonRePlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentLessonRePlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
    /* Declare the variables here */
    DECLARE vvRequestType              VARCHAR(50);
    
    SELECT LH.`RequestType`, LA.`RequestOption`
    INTO    vvRequestType, vAction
    FROM `lpassignmentheader`  LH
       join `lprequestabsent`         LA on LH.`LPAssignmentHeaderID` = LA.`LPAssignmentHeaderID`
    WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
    
    
    
    IF (vvRequestType = 'Absent') THEN
      BEGIN 
        IF (vAction = 'PickupWork') THEN
          /* call PickupWork stored procedure */ 
          CALL `sp_AbsentRequest_PickupWorkLessonPlanning` (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate); 
        END IF;    
      
        IF (vAction like 'MakeupRequest_SD') THEN /* This Action can be for SD - Schedule Different Day */
          /* call PickupWork stored procedure */
          CALL `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SD` (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate);
        END IF; 
       
        IF (vAction LIKE 'MakeupRequest_SH') THEN /* This Action can be for SH - Stay for one hour next class*/
          /* call PickupWork stored procedure */
          CALL `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SH` (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate);
        END IF; 
        
        IF (vAction LIKE 'MakeupRequest_ST') THEN /* This Action can be for ST - Spread Time over next two classes */
          /* call PickupWork stored procedure */
          CALL `sp_AbsentRequest_MakeupRequestLessonPlanningfor_ST` (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate);
        END IF; 
         
        IF (vAction = 'ReAssignTheLesson') THEN
          /* call ReAssignPlan stored procedure */
          CALL `sp_AbsentRequest_ReAssignTheLessonPlanning` (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate);
        END IF;     
        
      END;
    END IF; 
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SD`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly                      VARCHAR(50);
  DECLARE cActive                           VARCHAR(50);
  DECLARE IsPlanFinished                    INT;
  DECLARE vvTotalWSOfTheDay                 INT;
  DECLARE vvPrevDayWSNo                     INT;
  DECLARE vvNoOfWSOfTheDay                  INT;
  DECLARE vvWorkType                        VARCHAR(50);
  DECLARE vvLevelStart                      VARCHAR(50);
  DECLARE vvStudentID                       CHAR(38);
  DECLARE vvStartingLevel                   INT;
  DECLARE vvStartingWorkSheetNum            INT;
  DECLARE vvSubject                         VARCHAR(50); 
  DECLARE vvNoOfWS                          INT;
  DECLARE vvEndOfWSNum                      INT;
  DECLARE vvWSStartDate                     DATE;
  DECLARE vvEndDate                         DATE;
  DECLARE vvWorksheetRangeStart             INT;
  DECLARE vvWorksheetRangeEnd               INT;
  DECLARE vvCurSortOrderLevel               INT;
  DECLARE vvCWDay                           VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW            BIT;
  DECLARE cAssessment                       VARCHAR(25);
  DECLARE cReviewPacket                     VARCHAR(25);
  DECLARE cInActive                         VARCHAR(25);
  DECLARE vvSubjectLevel                    VARCHAR(50);
  DECLARE vvCurrDate                        DATETIME;
  DECLARE vvWSStartNo                       INT;
  DECLARE vvWSEndNo                         INT;
  DECLARE vvRequestType                     VARCHAR(50);
  DECLARE vvIsPlanFinished                  INT;
  DECLARE vvReqStartDate                    DATE;
  DECLARE vvReqEndDate                      DATE;
  DECLARE vvNoOfDaysCWtoCW                  INT;
  DECLARE vvCWtoCWEndDate                   DATE;
  DECLARE cCWWorkType                       VARCHAR(20);
  DECLARE cHWWorkType                       VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW               INT;
  DECLARE vvNoOfWSRemaining                 INT;
  DECLARE vvDaysToLoops                     INT;
  DECLARE vvStartCWLoop                     INT;
  DECLARE cAbsent                           VARCHAR(50);
  DECLARE vvIsCWAssignment                  BIT;
  DECLARE vvStartTime                       TIME;
  DECLARE vvEndTime                         TIME;
  DECLARE vvNoOfCWsAsIfNowAfterMakeup       INT;
  DECLARE vvMakeUpDate                      DATE; 
  DECLARE vvMakeupSlotId                    CHAR(38);
  DECLARE vvReqDayNoOfWS                    INT;
  DECLARE vvMakeupDayNoOfWS                 INT; 
  DECLARE vvSysMsg                          VARCHAR(200); 
  DECLARE vvIsHoliday                       BIT;
  DECLARE vvHolidayDesc                     VARCHAR(200);
  declare vSplActivityMsg                   varchar(200);
  DECLARE vSplActivityCode                  VARCHAR(200);
  declare vvLessonPlanScoreAssignmentID     char(38);
  declare vvStartWSNumForAbsent             int;
 
 
 DROP TABLE IF EXISTS ttWorksheetRange;  
  
  CREATE TEMPORARY TABLE ttWorksheetRange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);
 
 
 
  /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done in Class only';
  SET vvNoOfCWsAsIfNowAfterMakeup = 0;
  set vSplActivityCode            = 'MakeupRequest_SD';
  
  
  SELECT `MakupDate`, `MakupSlotID`
  INTO vvMakeUpDate, vvMakeupSlotId
  FROM `lprequestabsent`
  WHERE `LPAssignmentHeaderId` = vLPAssignmentHeaderID;
                                  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, DATE_ADD((LH.`RequestStartDate`),INTERVAL 1 DAY), 
         LH.`RequestStartDate`, LH.`RequestEndDate`  
  INTO   vvStudentID,   vvSubject, vDate, vvReqStartDate, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
 
  
  select `WorksheetNum`
  into vvStartWSNumForAbsent
  from `worksheetscore`
  where `StudentID`       = vvStudentID and 
        `Subject`         = vvSubject   and
        `WorksheetDate`   = vvReqStartDate and 
        `Status`          = cActive
  order by `WorksheetNum` Limit 1;
  
  
  SELECT count(*)                      
  INTO vvReqDayNoOfWS
  FROM `worksheetscore` LP
  WHERE (LP.`StudentID` =  vvStudentID)   AND
        (LP.`Subject`   = vvSubject)      AND
        (LP.`Status`    = cActive)        AND
        (cast(LP.`WorksheetDate` as date)    = vvReqStartDate);
            
        
  SELECT COUNT(*)                      
  INTO vvMakeupDayNoOfWS
  FROM `worksheetscore` LP
  WHERE (LP.`StudentID` =  vvStudentID)   AND
        (LP.`Subject`   = vvSubject)      AND
        (LP.`Status`    = cActive)        AND
        (CAST(LP.`WorksheetDate` AS DATE)    = vvMakeUpDate); 
        
    
  /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` = vvStudentID)  AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (LP.`WorkType` NOT IN ('AW'))   AND
        (CAST(LP.`Date` AS DATE) >= CAST(vvReqStartDate AS DATE)); 
        
        
 /*  Update lesson planning days as InActive during absent days */
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` = vvStudentID)  AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (CAST(LP.`WorksheetDate` AS DATE) >= CAST(vvReqStartDate AS DATE)); 
        
        
         
        
    /* Insert the lesson plan during Absent days as work type Absent */  
    INSERT INTO `lessonplanscoreassignment`(`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`,
                                            `WorkType`, `CreatedBy`, `CreatedOn`, `Status`)
                                     SELECT  UUID(), vvStudentId, vvSubject, vvReqStartDate, cAbsent, 
                                             vUserId, CURRENT_TIMESTAMP, cActive;
                                  
        
  /* Remove the slot on Requested date as they have requested to makeup on another day 
     for class work hence we removing the slot on requested date and booking the slot 
     on makeup date */
       
     UPDATE `studentcenterslot`
     SET `UpdatedBy`  = vUserId, 
         `UpdatedOn`  = CURRENT_TIMESTAMP,
         `Status`     = cInActive
     WHERE `StudentID` = vvStudentID     AND 
           `Subject`   = vvSubject       AND
           `Date`      = vvReqStartDate  AND
           `Status`    = cActive;
           
     INSERT INTO `studentcenterslot` (`StudentCenterSlotID`, `StudentID`, `Subject`, `Date`, `SlotID`, `CreatedBy`, 
                                      `CreatedOn`, `Status`, `StartDate`)
                               SELECT UUID(), vvStudentID, vvSubject, vvMakeUpDate, vvMakeupSlotId, vUserId, 
                                      CURRENT_TIMESTAMP, cActive, CURRENT_TIMESTAMP;
                                                                   
  SET vvEndDate       = CONCAT(YEAR(vDate), '-12-31'),
      vSplActivityMsg = CONCAT('Makeup request - schedule another day ( Orig: ', vvReqStartDate, '-', SUBSTRING(DAYNAME(vvReqStartDate), 1,3), ')'),
      vvSubjectLevel  = CONCAT(vvSubject, 'Level');
  
  SELECT `Level`
  INTO vvLevelStart
  FROM `worksheetscore` LP
    JOIN `stringmap` S ON S.`StringMapName` = LP.`Level` AND 
                        S.`StringMapType` = vvSubjectLevel
  WHERE LP.`Status`    = cActive AND 
        LP.`StudentID` = vvStudentID AND 
        LP.`Subject`   = vvSubject     AND 
        S.Status       = cActive 
  ORDER BY S.SortOrder DESC LIMIT 1;
  
  
  /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
        SET vvWorkType                     = NULL,
            vvNoOfWSOfTheDay               = NULL,
            vvWorksheetRangeEnd            = NULL,
            vvWorksheetRangeStart          = NULL,
            vvPrevDayWSNo                  = NULL,
            vvIsAssessmentDoneonCW         = 0,
            vvWSEndNo                      = NULL,
            vvStartTime                    = NULL,
            vvIsHoliday                    = NULL, 
            vvHolidayDesc                  = NULL,
            vvEndTime                      = NULL;
        
        
          /* Fetch the current day work type */
          SELECT CASE WHEN vDate =  vvMakeUpDate   THEN cCWWorkType
                      WHEN vDate =  vvReqStartDate THEN cHWWorkType
                 ELSE LW.`WorkType` END, 
                 CASE WHEN vDate =  vvMakeUpDate   THEN vvReqDayNoOfWS
                      WHEN vDate =  vvReqStartDate THEN vvMakeupDayNoOfWS
                 ELSE LW.`NoOfWS` END, SL.`WSEndNo`, SL.`WSStartNo` 
          INTO   vvWorkType,    vvNoOfWSOfTheDay, vvWSEndNo, vvWorksheetRangeStart
          FROM `lpworksheetassignment` LW
            LEFT JOIN `studentsubjectlevel`  SL  ON LW.`StudentID` = SL.`StudentID` AND 
                                                    LW.`Subject`   = SL.`Subject`   AND
                                                    SL.`Level`     = vvLevelStart   and
                                                    SL.Status      = cActive
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType`     IN ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject)       AND 
                (LW.`StudentID`    = vvStudentID)     AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          
          
          
        SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                    ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent 
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart;  
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
                     
          IF(vvWorkType = cCWWorkType) THEN 
            BEGIN
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    SS.Status               = cActive     AND
                    CAST(SS.`Date` AS DATE) = vDate       AND
	            S.Status                = cActive
                    LIMIT 1;
            END;
            END IF;
         IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF;          
          
         
          /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR vvPrevDayWSNo = vvWSEndNo THEN coalesce(vvWorksheetRangeStart, 1) 
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
          
           
           SET vvLessonPlanScoreAssignmentID = UUID();  
             
                       
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                   `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`, `SpecialActivity`, `SpecialActivityDesc`, `SysMessage`, `CreatedBy`, 
                                                    `CreatedOn`,  `Status`, `StartDate` )
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes,  
                                                     CASE WHEN vvMakeUpDate = vDate THEN vSplActivityCode ELSE NULL END,
                                                     CASE WHEN vvMakeUpDate = vDate THEN vSplActivityMsg ELSE NULL END,
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, vUserId, 
                                                     CURRENT_TIMESTAMP, cActive, CURDATE();
                                                     
            if(vvWorkType is not null) then
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            end if;
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
				
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
				
				
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                  WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND  
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                  
                  IF( vvWorkType = cCWWorkType) THEN
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                         LIMIT 1;
                   END IF;
				   
				   
                   IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                     SELECT 1, HolidayDesc, cHWWorkType 
                     INTO vvIsHoliday, vvHolidayDesc, vvWorkType
                     FROM `holiday`
                     WHERE HolidayDate = vDate;
             
                   END IF;
                   
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 0, 0,vNotes, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(),
                                                                  NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `SpecialActivity`, `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cCWWorkType, 0, 0,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes,cAssessment, 
                                                                  Null, vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, 
                                                                  CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                              LIMIT 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`,  `SpecialActivity`, 
                                                                 `SysMessage`, `CreatedBy`, `UpdatedBy`, `CreatedOn`, 
                                                                 `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cHWWorkType, 0, 0, 
                                                                  vNotes, cReviewPacket,
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
  
  
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate; 
                        
             set vvStartWSNumForAbsent = null;                            
        
      END WHILE;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentRequest_MakeupRequestLessonPlanningfor_SH`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
    /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvSpreadNoOfWS             INT;
  DECLARE vvHNoOfWS1                 INT;
  DECLARE vvHNoOfWS2                 INT;
  DECLARE vvNoOfCWsAsIfNowAfterMakeup INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vSplActivityMsg            VARCHAR(200);
  declare vSplActivityCode           varchar(50);
  DECLARE vvLessonPlanScoreAssignmentID   
                                     CHAR(38);
  DECLARE vvStartWSNumForAbsent      INT; 
  
  DROP TABLE IF EXISTS ttWorksheetRange;  
  
  CREATE TEMPORARY TABLE ttWorksheetRange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);                                  
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done in Class only';
  SET vvNoOfCWsAsIfNowAfterMakeup = 0;
  set vSplActivityCode            = 'MakeupRequest_SH';
  
  
 
 
  
  DROP TEMPORARY  TABLE  IF EXISTS ttlessonplanscoreassignmentcw;
  /* Craete temp table to hold CW related data to process furhter */
  CREATE TEMPORARY TABLE ttLessonplanscoreassignmentCW (RecordId                      INT AUTO_INCREMENT PRIMARY KEY,
                                                        LessonPlanScoreAssignmentID   CHAR(38),
                                                        StudentId                     VARCHAR(50),
                                                        SUBJECT                       VARCHAR(50),
                                                        DATE                          DATETIME,
                                                        WorkType                      VARCHAR(50),
                                                        NoOfWS                        INT,
                                                        STATUS                        VARCHAR(50));
                                                        
  /* Fetch and insert the data during absent days to process further */
  INSERT INTO ttLessonplanscoreassignmentCW (LessonPlanScoreAssignmentID, StudentId, SUBJECT, DATE, WorkType, 
                                              STATUS, NoOfWS)
                                     SELECT  LS.`LessonPlanScoreAssignmentID`, LS.`StudentID`, LS.`Subject`,
                                             LS.`Date`, LS.`WorkType`,  LS.`Status`, 0
                                     FROM `lessonplanscoreassignment` LS
                                       JOIN `lpassignmentheader` LH ON LH.`StudentID` = LS.`StudentID` AND 
                                                                       LH.`Subject`   = LS.`Subject`
                                     WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)               AND
                                           (CAST(`Date` AS DATE)      = CAST(LH.`RequestStartDate` AS DATE)) and 
                                            (LS.Status                = cActive);
                                           
                                         
   
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, DATE_ADD((LH.`RequestStartDate`),INTERVAL 1 DAY),
         LH.`RequestStartDate`, LH.`RequestEndDate`  
  INTO   vvStudentID,   vvSubject, vDate, vvReqStartDate, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
  
  SELECT `WorksheetNum`
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   = vvReqStartDate AND 
        `Status`          = cActive
  ORDER BY `WorksheetNum` LIMIT 1;
  
  
  SELECT level
  INTO vvLevelStart
  FROM `worksheetscore`
  WHERE `StudentID`     =  vvStudentId AND 
        `Subject`       =  vvSubject AND
        cast(`WorksheetDate` as date) = vvReqStartDate AND 
        `Status`        = cActive
  LIMIT 1;
  
  
   SELECT COUNT(*) 
    INTO vvSpreadNoOfWS
    FROM `worksheetscore` WS
       JOIN `lessonplanscoreassignment` LP ON LP.`LessonPlanScoreAssignmentID` = WS.`LessonPlanScoreAssignmentID`
    WHERE LP.WorkType = cCWWorkType AND 
          WS.StudentId = vvStudentId AND 
          WS.Subject   = vvSubject  AND 
          CAST(`Date` AS DATE) BETWEEN  vvReqStartDate AND COALESCE(vvReqEndDate, vvReqStartDate) AND
          LP.Status = 'Active' AND WS.Status = 'Active';
          
          
  /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (LP.`WorkType` NOT IN ('AW'))   AND
        (LP.`Date` >= vvReqStartDate);
        
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (LP.`WorksheetDate` >= vvReqStartDate);    
        
  /* Insert the lesson plan during Absent days as work type Absent */  
  INSERT INTO `lessonplanscoreassignment`(`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`, 
                                          `CreatedBy`, `CreatedOn`, `Status`)
                                   SELECT  UUID(), StudentId, SUBJECT, DATE, cAbsent, vUserId, CURRENT_TIMESTAMP,
                                           'Active'
                                   FROM ttLessonplanscoreassignmentCW;  
                                   
  SET vvEndDate  = CONCAT(YEAR(vDate), '-12-31');
  SET vDate     = Date_Add((vvReqStartDate), interval 1 day);
  
  SET vSplActivityMsg   = CONCAT('Makeup request - stay one hour ( Orig: ', vvReqStartDate, '-', SUBSTRING(DAYNAME(vvReqStartDate), 1,3), ')');
 
    
    SELECT vvSpreadNoOfWS INTO vvHNoOfWS1;
     
    /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType                     = NULL,
              vvNoOfWSOfTheDay               = NULL,
              vvWorksheetRangeEnd            = NULL,
              vvWorksheetRangeStart          = NULL,
              vvPrevDayWSNo                  = NULL,
              vvIsAssessmentDoneonCW         = 0,
              vvWSEndNo                      = NULL,
              vvStartTime                    = NULL,
              vvEndTime                      = NULL,
              vvIsHoliday                    = Null,
              vvHolidayDesc                  = null,
              vvNoOfCWsAsIfNowAfterMakeup    = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`,      SL.`WSEndNo`, SL.`WSStartNo` 
          INTO   vvWorkType,    vvNoOfWSOfTheDay, vvWSEndNo, vvWorksheetRangeStart
          FROM `lpworksheetassignment` LW
            LEFT JOIN `studentsubjectlevel`  SL  ON LW.`StudentID` = SL.`StudentID` AND 
                                                    LW.`Subject`   = SL.`Subject`   AND
                                                    SL.`Level`     = vvLevelStart   and
                                                    SL.Status     = cActive
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject)     AND 
                (LW.`StudentID`    = vvStudentID)   AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
                       
          
         SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
          
          
          SELECT CW.`IsCWAssignment`
          INTO vvIsCWAssignment
          FROM `conceptworksheet` CW
            JOIN `concepttoc` CT ON CW.`ConceptTOCID` = CW.`ConceptTOCID`
          WHERE (CT.`Subject` = vvSubject) AND (CT.`Level` = vvLevelStart) AND 
                ((vvWorksheetRangeStart BETWEEN CW.`WorksheetRangeStartN` AND CW.`WorksheetRangeEndN`) OR
                 (vvWorksheetRangeEnd   BETWEEN CW.`WorksheetRangeStartN` AND CW.`WorksheetRangeEndN`))
          LIMIT 1; 
          
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
           END IF;          
          
                         
         
          IF(vvWorkType = cCWWorkType) THEN 
            BEGIN
            
              IF(vvHNoOfWS1 > 0) THEN     
              
              SELECT COUNT(*) + 1 
              INTO vvNoOfCWsAsIfNowAfterMakeup          
              FROM `lessonplanscoreassignment`
              WHERE `WorkType` = cCWWorkType    AND 
                `StudentID`  = vvStudentId  AND
                `Subject`    = vvSubject    AND
                `Status`     = cActive     AND  
                `Date`       > COALESCE(vvReqEndDate, vvReqStartDate);
              
              END IF; 
             
              
              SELECT S.`StartTime`, CASE WHEN vvNoOfCWsAsIfNowAfterMakeup <=2 AND 
                                              (vvHNoOfWS1 > 0 OR vvHNoOfWS2 > 0) THEN ADDTIME(S.`EndTime`,'00:30:00')
                                         ELSE S.`EndTime` END
              INTO vvStartTime, vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
                    limit 1;
              
              
              
              
            END;
            END IF;
          
         
          /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
          
         SELECT CASE WHEN vvNoOfCWsAsIfNowAfterMakeup = 1 THEN vvWorksheetRangeEnd + vvHNoOfWS1
                ELSE vvWorksheetRangeEnd END INTO vvWorksheetRangeEnd;
           
         
           
           SET vvLessonPlanScoreAssignmentID = UUID();           
                       
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                   `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                    `Notes`,  `SysMessage`, `SpecialActivity`, `SpecialActivityDesc`,
                                                    `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     CASE WHEN vvNoOfCWsAsIfNowAfterMakeup = 1 THEN vSplActivityCode ELSE NULL END,
                                                     CASE WHEN vvNoOfCWsAsIfNowAfterMakeup = 1 THEN vSplActivityMsg ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
   
           IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
          
            
          
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                
                   SET vvWorkType                     = NULL,
                       vvStartTime                    = NULL,
                       vvEndTime                      = NULL,
                       vvIsHoliday                    = NULL,
                       vvHolidayDesc                  = NULL;
                       
                       
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                  WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND
                        (LW.`WorkType` IN   ('CW', 'HW' ))                  AND  
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                         LIMIT 1;
                         
                         
                   IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1, HolidayDesc, cHWWorkType 
                      INTO vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM `holiday`
                      WHERE HolidayDate = vDate;
             
                   END IF;   
                 
                    
                     /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`,  `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 0, 0,vNotes, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                      SET vvIsAssessmentDoneonCW   = 1;
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `SysMessage`, `SpecialActivity`, `CreatedBy`, 
                                                                 `UpdatedBy`, `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, 
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cCWWorkType, 0, 0, vvStartTime, vvEndTime, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,                                                                  
                                                                  cAssessment, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */        
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive
                        limit 1;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                              LIMIT 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `SysMessage`, `SpecialActivity`, 
                                                                 `CreatedBy`, `UpdatedBy`, `CreatedOn`, `UpdatedOn`, 
                                                                 `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cHWWorkType, 
                                                                 0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                                  cReviewPacket, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                         
                                                          
                      END; 
                    END IF;                   
                           
                
                END WHILE;  /*  While end for review packets/Assessments */ 
            END;
            END IF;          
          
          
          
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
                        
            SELECT CASE WHEN IFNULL(vvNoOfCWsAsIfNowAfterMakeup, 0) = 1 THEN 0 ELSE vvHNoOfWS1 END INTO vvHNoOfWS1;
            
            SET vvStartWSNumForAbsent = NULL;   
             
      END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentRequest_MakeupRequestLessonPlanningfor_ST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentRequest_MakeupRequestLessonPlanningfor_ST`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
    /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvSpreadNoOfWS             INT;
  DECLARE vvHNoOfWS1                 INT;
  DECLARE vvHNoOfWS2                 INT;
  DECLARE vvNoOfCWsAsIfNowAfterMakeup INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vSplActivityMsg            VARCHAR(200);
  declare vSplActivityCode           varchar(50);
  declare vvLessonPlanScoreAssignmentID char(38);
  DECLARE vvStartWSNumForAbsent      INT; 
  
  DROP TABLE IF EXISTS ttWorksheetRange;  
  
  CREATE TEMPORARY TABLE ttWorksheetRange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);  
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done in Class only';
  SET vvNoOfCWsAsIfNowAfterMakeup = 0;
  set vSplActivityCode            = 'MakeupRequest_ST';
  
  
  DROP TEMPORARY  TABLE  IF EXISTS ttlessonplanscoreassignmentcw;
  /* Craete temp table to hold CW related data to process furhter */
  CREATE TEMPORARY TABLE ttLessonplanscoreassignmentCW (RecordId                      INT AUTO_INCREMENT PRIMARY KEY,
                                                        LessonPlanScoreAssignmentID   CHAR(38),
                                                        StudentId                     VARCHAR(50),
                                                        SUBJECT                       VARCHAR(50),
                                                        DATE                          DATETIME,
                                                        WorkType                      VARCHAR(50),
                                                        NoOfWS                        INT,
                                                        STATUS                        VARCHAR(50));
                                                        
  /* Fetch and insert the data during absent days to process further */
  INSERT INTO ttLessonplanscoreassignmentCW (LessonPlanScoreAssignmentID, StudentId, SUBJECT, DATE, WorkType, 
                                            STATUS, NoOfWS)
                                     SELECT  LS.`LessonPlanScoreAssignmentID`, LS.`StudentID`, LS.`Subject`,
                                             LS.`Date`, LS.`WorkType`, LS.`Status`, 0
                                     FROM `lessonplanscoreassignment` LS
                                       JOIN `lpassignmentheader` LH ON LH.`StudentID` = LS.`StudentID` AND 
                                                                       LH.`Subject`   = LS.`Subject`
                                     WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                                           (CAST(`Date` AS DATE)      = CAST(LH.`RequestStartDate` AS DATE)) and 
                                           LS.Status                  = cActive;
                                  
                                  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, DATE_ADD((LH.`RequestStartDate`),INTERVAL 1 DAY),
         LH.`RequestStartDate`, LH.`RequestEndDate`  
  INTO   vvStudentID,   vvSubject, vDate, vvReqStartDate, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
  
  SELECT LEVEL
  INTO vvLevelStart
  FROM `worksheetscore`
  WHERE `StudentID`     =  vvStudentId AND 
        `Subject`       =  vvSubject AND
        CAST(`WorksheetDate` AS DATE) = vvReqStartDate AND 
        `Status`        = cActive
  LIMIT 1;
  
   SELECT `WorksheetNum`
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   = vvReqStartDate AND 
        `Status`          = cActive
  ORDER BY `WorksheetNum`  LIMIT 1;
  
  /* ST - Spread Time over next two classes */
   
    SELECT COUNT(*) 
    INTO vvSpreadNoOfWS
    FROM `worksheetscore` WS
       JOIN `lessonplanscoreassignment` LP ON LP.`LessonPlanScoreAssignmentID` = WS.`LessonPlanScoreAssignmentID`
    WHERE LP.WorkType = cCWWorkType AND 
          WS.StudentId = vvStudentId AND 
          WS.Subject   = vvSubject  AND 
          CAST(`Date` AS DATE) BETWEEN  vvReqStartDate AND COALESCE(vvReqEndDate, vvReqStartDate) AND
          LP.Status = 'Active' AND WS.Status = 'Active';
  
  /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (LP.`WorkType` NOT IN ('AW'))   AND
        (cast(LP.`Date` as date) >= vvReqStartDate); 
        
        
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (CAST(LP.`WorksheetDate` AS DATE) >= vvReqStartDate);    
        
    /* Insert the lesson plan during Absent days as work type Absent */  
  INSERT INTO `lessonplanscoreassignment`(`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,
                                          `CreatedBy`, `CreatedOn`, `Status`)
                                   SELECT  UUID(), StudentId, SUBJECT, DATE, cAbsent, vUserId, CURRENT_TIMESTAMP,
                                           'Active'
                                   FROM ttLessonplanscoreassignmentCW;  
                                   
  SET vvEndDate  = CONCAT(YEAR(vDate), '-12-31');
  SET vDate     = DATE_ADD((vvReqStartDate), INTERVAL 1 DAY);
  SET vSplActivityMsg   = CONCAT('Makeup request - spread work over next two classes ( Orig: ', vvReqStartDate, '-', SUBSTRING(DAYNAME(vvReqStartDate), 1,3), ')');
  
  


    SELECT FLOOR(vvSpreadNoOfWS/2) INTO vvHNoOfWS1;
    SELECT  vvSpreadNoOfWS - vvHNoOfWS1 INTO vvHNoOfWS2;  
    
    
    
    /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
        
        
          SET vvWorkType                     = NULL,
              vvNoOfWSOfTheDay               = NULL,
              vvWorksheetRangeEnd            = NULL,
              vvWorksheetRangeStart          = NULL,
              vvPrevDayWSNo                  = NULL,
              vvIsAssessmentDoneonCW         = 0,
              vvWSEndNo                      = NULL,
              vvStartTime                    = NULL,
              vvEndTime                      = NULL,
              vvIsHoliday                    = null,
              vvHolidayDesc                  = null,
              vvNoOfCWsAsIfNowAfterMakeup    = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`,  SL.`WSEndNo`, SL.`WSStartNo` 
          INTO   vvWorkType,    vvNoOfWSOfTheDay, vvWSEndNo, vvWorksheetRangeStart
          FROM `lpworksheetassignment` LW
           LEFT JOIN `studentsubjectlevel`  SL  ON LW.`StudentID` = SL.`StudentID` AND 
                                                   LW.`Subject`   = SL.`Subject`   AND
                                                   SL.`Level`     = vvLevelStart   and
                                                   SL.Status      = cActive
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND 
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND  
                (LW.`Subject`      = vvSubject)     AND 
                (LW.`StudentID`    = vvStudentID)   AND
                (LW.`Status`       = cActive)      
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
                       
          
          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
          
          
          SELECT CW.`IsCWAssignment`
          INTO vvIsCWAssignment
          FROM `conceptworksheet` CW
            JOIN `concepttoc` CT ON CW.`ConceptTOCID` = CW.`ConceptTOCID`
          WHERE (CT.`Subject` = vvSubject) AND (CT.`Level` = vvLevelStart) AND 
                ((vvWorksheetRangeStart BETWEEN CW.`WorksheetRangeStartN` AND CW.`WorksheetRangeEndN`) OR
                 (vvWorksheetRangeEnd   BETWEEN CW.`WorksheetRangeStartN` AND CW.`WorksheetRangeEndN`))
          LIMIT 1;             
          
                         
         
          IF(vvWorkType = cCWWorkType) THEN 
            BEGIN
              
              
              
              IF(vvHNoOfWS1 > 0 OR vvHNoOfWS2 > 0) THEN     
              
              SELECT COUNT(*) + 1 
              INTO vvNoOfCWsAsIfNowAfterMakeup          
              FROM `lessonplanscoreassignment`
              WHERE `WorkType` = cCWWorkType    AND 
                `StudentID`  = vvStudentId  AND
                `Subject`    = vvSubject    AND
                `Status`     = cActive AND 
                `Date`     > vvReqStartDate;
              
              END IF;      
              
              
              
             IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
             END IF; 
             
              
              SELECT S.`StartTime`, CASE WHEN vvNoOfCWsAsIfNowAfterMakeup <=2 AND 
                                              (vvHNoOfWS1 > 0 OR vvHNoOfWS2 > 0) THEN ADDTIME(S.`EndTime`,'00:15:00')
                                         ELSE S.`EndTime` END
              INTO vvStartTime, vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
              LIMIT 1;
              
              
            END;
            END IF;
          
         
          /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
          
         SELECT CASE WHEN vvNoOfCWsAsIfNowAfterMakeup = 1 THEN vvWorksheetRangeEnd + vvHNoOfWS1
                     WHEN vvNoOfCWsAsIfNowAfterMakeup = 2 THEN vvWorksheetRangeEnd + vvHNoOfWS2 
                ELSE vvWorksheetRangeEnd END INTO vvWorksheetRangeEnd;
         
       
           
           SET vvLessonPlanScoreAssignmentID = UUID();  
                   
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                   `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `SpecialActivity`, `SpecialActivityDesc`,
                                                     `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN IFNull(vvIsHoliday, 0) = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     CASE WHEN IFNULL(vvNoOfCWsAsIfNowAfterMakeup, 0) BETWEEN 1 AND 2 THEN  vSplActivityCode ELSE NULL END,
                                                     CASE WHEN IfNull(vvNoOfCWsAsIfNowAfterMakeup, 0) between 1 and 2 THEN  vSplActivityMsg ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
           
              IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                 
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvEndTime                      = NULL,
                      vvIsHoliday                    = NULL,
                      vvHolidayDesc                  = NULL;
                      
                  
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                  WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))                  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   limit 1;
                   
                   IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1, HolidayDesc, cHWWorkType 
                      INTO vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM `holiday`
                       WHERE HolidayDate = vDate;
             
                   END IF;  
                   
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 0, 0,
                                                                  vNotes, vUserId,NULL, CURRENT_TIMESTAMP, 
                                                                  NULL, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `SysMessage`, `SpecialActivity`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cCWWorkType, 
                                                                  0, 0, vvStartTime, vvEndTime, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                                  cAssessment, vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive
                        limit 1;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`,`SpecialActivity`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cHWWorkType,0, 0, 
                                                                  vNotes, cReviewPacket, vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, 
                                                                  CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
                        
            SELECT CASE WHEN IFNULL(vvNoOfCWsAsIfNowAfterMakeup, 0) = 1 THEN 0 ELSE vvHNoOfWS1 END INTO vvHNoOfWS1;
            SELECT CASE WHEN IFNULL(vvNoOfCWsAsIfNowAfterMakeup, 0) = 2 THEN 0 ELSE vvHNoOfWS2 END INTO vvHNoOfWS2;
            
            SET vvStartWSNumForAbsent = NULL;
             
      END WHILE;
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentRequest_PickupWorkLessonPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentRequest_PickupWorkLessonPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
    /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  declare vvPickupDate               dateTime; 
  declare vvPickupPersonName         varchar(100);
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done on Class only';
  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, DATE_ADD((LH.`RequestEndDate`),INTERVAL 1 DAY),
         LH.`RequestStartDate`, LH.`RequestEndDate`, LA.`PickupDateTime`,
         coalesce( concat(coalesce(concat(PR.`FirstName`, ' '), ''), COALESCE(PR.`LastName`, '')), LA.`PickupPersonOther`)
  INTO   vvStudentID,   vvSubject, vDate, vvReqStartDate, vvReqEndDate, vvPickupDate, vvPickupPersonName
  FROM `lpassignmentheader` LH 
    join `lprequestabsent` LA on LH.`LPAssignmentHeaderID` = LA.`LPAssignmentHeaderID`
    left join `parent`     PR on LA.`PickupPersonID`       = PR.`ParentId`
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
 
 
 /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`       = vUserId,
      LP.`UpdatedOn`       = CURRENT_TIMESTAMP,
      LP.`WorkType`        = cHWWorkType,
      LP.`FromTime`        = Null,
      LP.`ToTime`          = NULL,
      LP.`SpecialActivityDesc` = CONCAT('Pickup work ( Orig: Pickup person name: ', vvPickupPersonName, 'pickup date/time', vvPickupDate, '-', SUBSTRING(DAYNAME(vvPickupDate), 1,3), ')'),
      LP.`SpecialActivity` =  'PickupWork'
  WHERE (LP.`StudentID` = vvStudentID) AND
        (LP.`Subject`   = vvSubject)   AND
        (LP.`Status`    = cActive)     AND
        (LP.`WorkType`  not in ('NW', 'Absent')) and
        (cast(LP.`Date` as Date)  between vvReqStartDate and coalesce(vvReqEndDate, vvReqStartDate));
         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AbsentRequest_ReAssignTheLessonPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AbsentRequest_ReAssignTheLessonPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  declare cAbsent                    varchar(50);
  Declare vvIsCWAssignment           bit;
  declare vvSysMsg                   varchar(150);
  declare vvStartTime                TIME;
  declare vvEndTime                  Time;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vSplActivityMsg            VARCHAR(250);
  DECLARE vvLessonPlanScoreAssignmentID CHAR(38);
  declare vvStartWSNumForAbsent      int;
 
 DROP TABLE IF EXISTS ttWorksheetRange;  
  
  CREATE TEMPORARY TABLE ttWorksheetRange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);  
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  set cAbsent                     = 'Absent';
  set vvSysMsg                    = 'Work can be done on Class only';
  
  drop TEMPORARY  table  if exists ttlessonplanscoreassignmentcw;
  /* Craete temp table to hold CW related data to process furhter */
  CREATE TEMPORARY TABLE ttLessonplanscoreassignmentCW (RecordId                      INT AUTO_INCREMENT PRIMARY KEY,
                                                        LessonPlanScoreAssignmentID   CHAR(38),
                                                        StudentId                     VARCHAR(50),
                                                        SUBJECT                       VARCHAR(50),
                                                        DATE                          DATETIME,
                                                        WorkType                      VARCHAR(50),
                                                        STATUS                        VARCHAR(50));
                                                        
  /* Fetch and insert the data during absent days to process further */
  INSERT INTO ttLessonplanscoreassignmentCW (LessonPlanScoreAssignmentID, StudentId, SUBJECT, DATE, 
                                             WorkType, STATUS)
                                     SELECT  LS.`LessonPlanScoreAssignmentID`, LS.`StudentID`, LS.`Subject`,
                                             LS.`Date`, LS.`WorkType`,LS.`Status`
                                     FROM `lessonplanscoreassignment` LS
                                       join `lpassignmentheader` LH on LH.`StudentID` = LS.`StudentID` and 
                                                                       LH.`Subject`   = LS.`Subject`   
                                                                       
                                     WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) and
                                           (LS.Status                 = cActive) and
                                           (cast(LS.`Date` as date) between cast(LH.`RequestStartDate` as Date) and 
                                                                            cast(coalesce(LH.`RequestEndDate`, LH.`RequestStartDate`) as date))  and
                                            (LS.Status                 = cActive);
                                  
    
                                  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, DATE_ADD(COALESCE(LH.`RequestEndDate`, LH.`RequestStartDate`),INTERVAL 1 DAY),
         LH.`RequestStartDate`, coalesce(LH.`RequestEndDate` , LH.`RequestStartDate`)
  INTO   vvStudentID,   vvSubject, vDate, vvReqStartDate, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
  
  
  SELECT LEVEL
  INTO vvLevelStart
  FROM `worksheetscore`
  WHERE `StudentID`     =  vvStudentId AND 
        `Subject`       =  vvSubject AND
        CAST(`WorksheetDate` AS DATE) = vvReqStartDate AND 
        `Status`        = cActive
  LIMIT 1;
  
  SELECT `WorksheetNum`
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   = vvReqStartDate AND 
        `Status`          = cActive
  ORDER BY `WorksheetNum`  LIMIT 1;
  
  
  /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  where (LP.`StudentID` =  vvStudentID) and
        (LP.`Subject`   = vvSubject)    And
        (LP.`Status`    = cActive)      and
        (LP.`WorkType` not in ('AW'))   and
        (LP.`Date` >= vvReqStartDate);
        
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (LP.`WorksheetDate` >= vvReqStartDate);
        
          
          
  /* Insert the lesson plan during Absent days as work type Absent */  
  INSERT INTO `lessonplanscoreassignment`(`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`, 
                                          `CreatedBy`, `CreatedOn`, `Status`)
                                   SELECT  UUID(), StudentId, SUBJECT, DATE, cAbsent, vUserId, CURRENT_TIMESTAMP,
                                           'Active'
                                   FROM ttLessonplanscoreassignmentCW;  
                                   
  SET vvEndDate         = CONCAT(YEAR(vDate), '-12-31');
  SET vvSubjectLevel    = CONCAT(vvSubject, 'Level');
  SET vSplActivityMsg   = CONCAT('Reassign ( Orig: ', vvReqStartDate, '-', SUBSTRING(DAYNAME(vvReqStartDate), 1,3), ')');
  
  
  /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType                     = NULL,
              vvNoOfWSOfTheDay               = NULL,
              vvWorksheetRangeEnd            = NULL,
              vvWorksheetRangeStart          = NULL,
              vvPrevDayWSNo                  = NULL,
              vvIsAssessmentDoneonCW         = 0,
              vvWSEndNo                      = NULL,
              vvStartTime                    = NULL,
              vvIsHoliday                    = NULL, 
              vvHolidayDesc                  = NULL,
              vvEndTime                      = NULL;
        
        
         SELECT SL.`WSEndNo`, SL.`WSStartNo`  
        INTO    vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`  
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            LEFT JOIN `studentsubjectlevel`  SL  ON LW.`StudentID` = SL.`StudentID` AND 
                                                    LW.`Subject`   = SL.`Subject`   AND
                                                    SL.`Level`     = vvLevelStart 
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart;
          
          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
                     
          
         
          if(vvWorkType = cCWWorkType) then 
            begin
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
              limit 1;
            end;
            end If;
          
         
          /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR vvPrevDayWSNo = vvWSEndNo 
                       THEN COALESCE(vvWorksheetRangeStart, 1) 
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
          
         
         SELECT CW.`IsCWAssignment`
          INTO vvIsCWAssignment
          FROM `conceptworksheet` CW
            JOIN `concepttoc` CT ON CW.`ConceptTOCID` = CW.`ConceptTOCID`
          WHERE (CT.`Subject` = vvSubject) AND (CT.`Level` = vvLevelStart) AND 
                ((vvWorksheetRangeStart between CW.`WorksheetRangeStartN` and CW.`WorksheetRangeEndN`) or
                 (vvWorksheetRangeEnd   BETWEEN CW.`WorksheetRangeStartN` AND CW.`WorksheetRangeEndN`))
          LIMIT 1; 
                     
                 
          IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM Holiday
             WHERE HolidayDate = vDate;
             
          END IF;   
          
         
           SET vvLessonPlanScoreAssignmentID = UUID();  
             
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     -- case when vvIsCWAssignment = 1 then vvSysMsg else null end, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
         IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
                      
                      
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                  WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND
                        (LW.`WorkType` IN   ('CW', 'HW' ))                  AND  
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)                     
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   limit 1;
                   
                   
                   
  IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM Holiday
             WHERE HolidayDate = vDate;
             
          END IF; 
                   
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 
                                                                  0, 0,vNotes, vUserId,NULL, CURRENT_TIMESTAMP, 
                                                                  NULL, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cAssessment, 0, 0,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes, vUserId,NULL, CURRENT_TIMESTAMP, 
                                                                  NULL, cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cReviewPacket, 0, 0, 
                                                                  vNotes, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, 
                                                                  CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;   
                        
            SET vvStartWSNumForAbsent = NULL;
        
      END WHILE;
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssessmentOrReviewPacketPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssessmentOrReviewPacketPlanning`(
  In   vDate                   DATE,
  IN   vLPAssignmentHeaderID   char(38),
  IN   vUserId                 CHAR(38),
  IN   vStudentID              CHAR(38),
  IN   vSubject                varchar(50),
  In   vLevelStart             varchar(20),
  Out  vOutLevel               VARCHAR(20),
  out  vOutDate                date
  
)
BEGIN
  /* Declare the variables here */
  DECLARE vvWorkType                 VARCHAR(50);
  declare vNotes                     text;
  declare cActive                    varchar(50);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvExtSpecialActivity       VARCHAR(100);
  DECLARE vvExtRequestText           VARCHAR(100);
  DECLARE vvExtSysMessage            VARCHAR(100);
  DECLARE vvExtWorkType              VARCHAR(100);       
  DECLARE vvExtFromTime              TIME;
  Declare vvExtToTime                TIme;
  declare vvSysMessage               text;
  declare vvExtWSCount               Int;
  declare vvIsHoliday                int;
  declare vvHolidayDesc              text;
  declare vvNewSlotId                char(38);
  declare vvStartTime                Time;
  Declare vvEndTime                  Time;
  declare vReqStartDate              date;
  declare vReqEndDate                date;
  declare cInActive                  varchar(50);
  
  /* Initilize the variables here */
  set cActive                     = 'Active',
      vvIsAssessmentDoneonCW      =  0,
      cAssessment                 = 'Assessment',
      cReviewPacket               = 'Review Packet',
      cCWWorkType                 = 'CW',
      cHWWorkType                 = 'HW',
      cInActive                   = 'InActive',
      vvSubjectLevel              = CONCAT(vSubject, 'Level');
      
      select `RequestStartDate`, `RequestEndDate`
      into vReqStartDate, vReqEndDate
      from `lpassignmentheader`
      where `LPAssignmentHeaderID` = vLPAssignmentHeaderID;
      
   WHILE (vvIsAssessmentDoneonCW = 0) DO
     SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
     
     
      SELECT `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
             `FromTime`, `ToTime`
        INTO   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
               vvExtWorkType, vvExtFromTime,  vvExtToTime
        FROM `lessonplanscoreassignment` 
        WHERE `StudentID`   =  vStudentId  AND
              `Subject`     =  vSubject    AND
              `Date`        =  vDate        AND
              `WorkType`   NOT IN ('AW','NW') AND
              `Status`      =  cActive
              LIMIT 1;
              
       select count(*)
       into vvExtWSCount
       from `worksheetscore`
       where `StudentID`             =  vStudentId  AND
              `Subject`              =  vSubject    AND
              `WorksheetDate`        =  vDate        AND
              `Status`      =  cActive
              LIMIT 1;
              
     
     /*  Get the WorkType of the next day after 200th sheet */
     SELECT LW.`WorkType`
     INTO   vvWorkType
     FROM `lpworksheetassignment` LW
     WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
           (LW.`WorkType` IN   ('CW', 'HW' ))                  AND 
           (LW.`Subject`      = vSubject)                      AND 
           (LW.`StudentID`    = vStudentID)                    AND
           (LW.`Status`       = cActive)
      ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
      
     
      
      IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
         SELECT 1,           HolidayDesc,   cHWWorkType 
         INTO   vvIsHoliday, vvHolidayDesc, vvWorkType
         FROM Holiday
         WHERE HolidayDate = vDate
         LIMIT 1;
             
        END IF;   
      
     IF (vvExtWorkType <> 'Absent') THEN
     
     
     IF ((vDate BETWEEN vReqStartDate AND vReqEndDate) AND (vvWorkType = cCWWorkType)) THEN
       BEGIN     
       
       
       
       
           SELECT `NewSlotId`
           INTO vvNewSlotId 
           FROM `lprequesttimechange`
           WHERE `LPAssignmentHeaderID` = vLPAssignmentHeaderID           AND
                 `NewDOW`               = SUBSTRING(DAYNAME(vDate), 1, 3);
                 
          
       
           INSERT INTO `studentcenterslot` (`StudentCenterSlotID`, `StudentID`, `Subject`, `Date`,
                                           `SlotID`, `CreatedBy`, `CreatedOn`, `Status`)
                                     SELECT UUID(), vStudentId, vSubject, vDate, vvNewSlotId, 
                                            vUserId, CURRENT_TIMESTAMP, cActive; 
        END;           
      END IF; 
      
      IF (vvWorkType = cHWWorkType) AND 
         (EXISTS(SELECT 1 FROM `studentcenterslot` WHERE `Date`       =  vDate       AND 
                                                         `StudentID`  =  vStudentId AND
                                                         `Subject`    =  vSubject   AND
                                                         `Status`     =  cActive)) THEN
          BEGIN
              
              UPDATE `studentcenterslot`
              SET `Status`    = cInActive,
                  `UpdatedBy` = vUserId,
                  `UpdatedOn` = CURRENT_TIMESTAMP  
              WHERE `Date`       =  vDate       AND 
                    `StudentID`  =  vStudentId AND
                    `Subject`    =  vSubject   AND
                    `Status`     =  cActive; 
          
          END;
       END IF;
       
        SELECT S.`StartTime`, S.`EndTime`
      INTO vvStartTime, vvEndTime
      FROM `slot` S
       JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
      WHERE SS.`StudentID` = vStudentId AND 
            SS.Subject     = vSubject   AND
            CAST(SS.`Date` AS DATE)     = vDate
      LIMIT 1;
     
         
          
         /*  Update lesson planning days as InActive and initilize 
              the lesson planning again from the requested date */
              UPDATE `lessonplanscoreassignment` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vStudentID) AND
                    (LP.`Subject`   = vSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (LP.`WorkType`  NOT IN ('AW'))  AND
                    (CAST(LP.`Date` AS DATE) =    vDate);
                    
                    
           UPDATE `worksheetscore` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vStudentID) AND
                    (LP.`Subject`   = vSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (CAST(LP.`WorksheetDate` AS DATE) =    vDate); 
                    
                    

IF ((vDate BETWEEN vReqStartDate AND vReqEndDate) AND (vvWorkType = cCWWorkType)) THEN
       BEGIN     
       
       
       
       
           SELECT `NewSlotId`
           INTO vvNewSlotId 
           FROM `lprequesttimechange`
           WHERE `LPAssignmentHeaderID` = vLPAssignmentHeaderID           AND
                 `NewDOW`               = SUBSTRING(DAYNAME(vDate), 1, 3);
                 
          
       
           INSERT INTO `studentcenterslot` (`StudentCenterSlotID`, `StudentID`, `Subject`, `Date`,
                                           `SlotID`, `CreatedBy`, `CreatedOn`, `Status`)
                                     SELECT UUID(), vStudentId, vSubject, vDate, vvNewSlotId, 
                                            vUserId, CURRENT_TIMESTAMP, cActive; 
        END;           
      END IF; 
      
      IF (vvWorkType = cHWWorkType) AND 
         (EXISTS(SELECT 1 FROM `studentcenterslot` WHERE `Date`       =  vDate       AND 
                                                         `StudentID`  =  vStudentId AND
                                                         `Subject`    =  vSubject   AND
                                                         `Status`     =  cActive)) THEN
          BEGIN
              
              UPDATE `studentcenterslot`
              SET `Status`    = cInActive,
                  `UpdatedBy` = vUserId,
                  `UpdatedOn` = CURRENT_TIMESTAMP  
              WHERE `Date`       =  vDate       AND 
                    `StudentID`  =  vStudentId AND
                    `Subject`    =  vSubject   AND
                    `Status`     =  cActive; 
          
          END;
       END IF;
      
      
       /* If next day is Sunday or Holiday */
       IF (vvWorkType IS NULL) THEN
         BEGIN
           INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                    `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                    `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT UUID(), vStudentId, vSubject, vDate, 'NW', 0, 0,vNotes, 
                                                     vUserId,NULL, CURRENT_TIMESTAMP, 
                                                     NULL, cActive, CURDATE(), NULL; 
         
         END;
         END IF;
         
         
       /* If next day is CW */
       IF (vvWorkType = 'CW') THEN
         BEGIN
           INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                    `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                    `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                    `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT UUID(), vStudentId, vSubject, vDate, cAssessment,0, 0,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                     vNotes, vUserId,NULL, CURRENT_TIMESTAMP, 
                                                     NULL, cActive, CURDATE(), NULL; 
                                                  
           SET vvIsAssessmentDoneonCW   = 1;
               
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder` 
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, vDate  
                        INTO  vOutLevel, vOutDate
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        LIMIT 1;  
                                                    
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is HW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`,`SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vStudentId, vSubject, vDate, cReviewPacket, 0, 0, 
                                                                  vNotes, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, 
                                                                  CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                end if;
              END WHILE;  /*  While end for review packets/Assessments */ 
              
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStaffSlot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStaffSlot`(
	IN vStaffSlotAssignmentRequestID CHAR (38),
	IN vUserID CHAR(38)
)
BEGIN
	
	
	
		DECLARE cPROCESSED VARCHAR(50);
		DECLARE cPENDING VARCHAR(50);
		DECLARE cACTIVE VARCHAR(50);
		DECLARE cINACTIVE VARCHAR(50);
	
		DECLARE vvStaffId              CHAR(38);
		DECLARE vvSlotId       CHAR(38);
		DECLARE vvDayOfWeek              VARCHAR(50);
		DECLARE vvIsPermanent              BIT;
		-- DECLARE vvSubject              VARCHAR(50);
		DECLARE vvRequestStartDate DATE;
		DECLARE vvRequestEndDate DATE;
		DECLARE vvRequestType VARCHAR(50);
		DECLARE vvDone INT;
		DECLARE vvStaffSlotAssignmentRequestID CHAR(38);
		DECLARE vvStaffSlotAssignmentRequestDetailID CHAR(38);
		DECLARE vvCurrTimeStamp DATETIME;	
		DECLARE vvCurrDate DATETIME;	
		DECLARE vvLoopCounter INT;	
	
		
		
	        	
		DECLARE curStaffSlotAssignment CURSOR FOR 
		
		SELECT  ssar.StaffSlotAssignmentRequestID, ssard.StaffSlotAssignmentRequestDetailID, ssar.StaffID,  ssard.DayOfWeek, 
			ssard.slotID, ssar.RequestStartDate, ssard.RequestType,  ssar.RequestEndDate, ssar.IsPermanent
		FROM staffslotassignmentrequest ssar 
		JOIN staffslotassignmentrequestdetail ssard ON ssar.`StaffSlotAssignmentRequestID` = ssard.`StaffSlotAssignmentRequestID`
WHERE ssar.StaffSlotAssignmentRequestID =  vStaffSlotAssignmentRequestID 
		ORDER BY ssard.RequestType DESC;
		
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET vvDone=1;
		
		SET vvDone = 0;		
			
		SET cACTIVE = 'Active';	
	        SET cINACTIVE = 'Inactive';
		SET cPROCESSED = 'PROCESSED';
		SET cPENDING = 'PENDING';
		SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	        SET vvCurrDate = CURDATE();
	
		    
		    SELECT 'before cursor';
		    OPEN curStaffSlotAssignment;
		
		
		SET vvLoopCounter = 1;
		
		assignLoop: REPEAT
	/*
	ssar.StaffSlotAssignmentRequestID, ssard.StaffSlotAssignmentRequestDetailID, ssar.StaffID,  ssard.DayOfWeek, 
			ssard.slotID, ssar.RequestStartDate, ssard.RequestType,  ssar.RequestEndDate, ssar.IsPermanent
	
	*/
	
	
		FETCH curStaffSlotAssignment INTO 
			vvStaffSlotAssignmentRequestID, vvStaffSlotAssignmentRequestDetailID, vvStaffID,  vvDayOfWeek, 
			vvSlotID, vvRequestStartDate, vvRequestType, vvRequestEndDate, vvIsPermanent;
		
		IF vvDone = 1 THEN
			LEAVE assignLoop;
		END IF;
		
		
			
			SELECT 'in cursor', vvLoopCounter, vvDone, vvRequestType, vvStaffSlotAssignmentRequestDetailID, vvDayOfWeek;
			
		IF (vvRequestType = 'ADD') THEN
		BEGIN
		CALL sp_AssignStaffSlotAdd (vvStaffID,  vvDayofWeek,  vvSlotID, vvIsPermanent, vvRequestStartDate,vvRequestEndDate, vUserId );
		END;
		ELSEIF (vvRequestType = 'REMOVE') THEN
		BEGIN
			CALL sp_AssignStaffSlotRemove (vvStaffID,  vvDayofWeek,  vvSlotID, vvIsPermanent,  vvRequestStartDate,vvRequestEndDate, vUserId );
		
		END;
		END IF;
		
		SELECT 'before update';
		UPDATE
		  `Staffslotassignmentrequestdetail`
		SET
		  `Status` = cPROCESSED,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp
		WHERE StaffSlotAssignmentRequestDetailID = vvStaffSlotAssignmentRequestDetailID;
		
		
		SELECT 'after update';
		
		
		SET vvLoopCounter = vvLoopCounter + 1;	
			
		
		UNTIL vvDone END REPEAT assignLoop;
		
		
		
		SELECT 'out of cursor';
			
		UPDATE
		  `Staffslotassignmentrequest`
		SET
		  `Status` = cPROCESSED,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp
		WHERE StaffSlotAssignmentRequestID = vvStaffSlotAssignmentRequestID;
		
		SELECT 'before closing';
		CLOSE curStaffSlotAssignment;
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStaffSlotAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStaffSlotAdd`(
    
  IN vStaffID CHAR(38),
  IN vDayofWeek VARCHAR(50),
  IN vSlotID CHAR(38),
  IN vIsPermanent BIT,
  IN vStartDate              DATE,
  IN vEndDate                DATE,    
  IN vUserId                 VARCHAR(40)
    
    )
BEGIN
DECLARE cACTIVE VARCHAR(50);
DECLARE cINACTIVE VARCHAR(50);
 DECLARE vvDummy              INT;
 DECLARE vvRunDate              DATE;
  DECLARE vvStaffId              CHAR(38);
   DECLARE vvSlotId       CHAR(38);
    DECLARE vvDayOfWeek              VARCHAR(50);
    DECLARE vvIsPermanent              BIT;
    
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATETIME;
    DECLARE vvCurrDate              DATE;
    
    DECLARE vvUUID char (38);
     DECLARE vStaffType CHAR (38);
    
    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
	SET vvRunDate = vStartDate;
 
 
	 IF (vEndDate IS NULL) THEN
	 BEGIN
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   
		
	 
	END;	
	END IF;
	
	SELECT 'point 1', vvRunDate, vStartDate, vEndDate, vDayofWeek;
	SELECT 
	CASE WHEN vDayofWeek = 'Sun' THEN 1
	 WHEN vDayofWeek = 'Mon' THEN 2
	 WHEN vDayofWeek = 'Tue' THEN 3
	 WHEN vDayofWeek = 'Wed' THEN 4
	 WHEN vDayofWeek = 'Thu' THEN 5
	 WHEN vDayofWeek = 'Fri' THEN 6
	 WHEN vDayofWeek = 'Sat' THEN 7 END
	 INTO vvDayNumDB;
	 
	 
	 
	 select 'pt 2', vIsPermanent, vvDayNumDB;
	
	set vvDayOfWeek = vDayofWeek;
	SET vvSlotId = vSlotID;
	SET vvStaffId = vStaffID;
	
	SET vvIsPermanent = vIsPermanent;
	SELECT StaffType INTO vStaffType FROM staff WHERE StaffID = vStaffID;
	
	-- Insert a row into StaffAssignmentTemplate
	set vvUUID = UUID();
	SELECT 'pt 3', vvUUID;
	INSERT INTO `staffassignmenttemplate` (
	  `StaffAssignmentID`,
	  `DayOfWeek`,
	  `SlotID`,
	  `StaffID`,
	  `StaffType`,
	  `IsPermanent`,
	  `CreatedBy`,
	  `CreatedOn`,
	  `Status`,
	  `StartDate`,
	  `EndDate`
	)
	VALUES
	  (
	    vvUUID,
	    vvDayOfWeek,
	    vvSlotID,
	    vvStaffID,
	    vStaffType,
	    vvIsPermanent,
	    vUserID,
	    vvCurrTimeStamp,
	    cActive, 
	    vStartDate,
	    vEndDate
	  );
	
	-- select vvDayNumDB;
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	SELECT 'before', vvRunDate, vvDayNumDB;
	
	
	-- select vvRunDate;
	
        IF vvRunDate < vStartDate THEN
        BEGIN
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		SELECT 'in if 1', vvRunDate;
		-- SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
		SELECT 'in if 2', vvRunDate;
	END;
	END IF;
        SELECT 'out of if', vvRunDate; 
	WHILE (vEndDate >= vvRunDate) 
        DO 
        
			-- SELECT vvRunDate;
		
        
        
        
        -- todo: Check if for the same Staff, same day, same subject and same slot with status = "active" then don't do anything
        
			INSERT INTO `staffassignment` (
			  `StaffAssignmentID`,
			  `StaffID`,
			  `StaffType`,
			  `Date`,
			  `SlotID`,
			  `CreatedBy`,
			  `CreatedOn`,
			  `Status`,
			  `StartDate`
			)
			VALUES
			  (
			    UUID(),
			    vvStaffID,
			    vStaffType,
			    vvRunDate,
			    vvSlotID,
			    vUserId,
			    vvCurrTimeStamp,
			    cActive , 
			    vvCurrDate
			  );
			  
        
		SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      
        END WHILE;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStaffSlotRemove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStaffSlotRemove`(
    
 IN vStaffID CHAR(38),
  IN vDayofWeek VARCHAR(50),
  IN vSlotID CHAR(38),
  IN vIsPermanent BIT,
  IN vStartDate              DATE,
  IN vEndDate                DATE,    
  IN vUserId                 VARCHAR(40)
  
    )
BEGIN
DECLARE cACTIVE VARCHAR(50);
DECLARE cINACTIVE VARCHAR(50);
 DECLARE vvDummy              INT;
 DECLARE vvRunDate              DATE;
  DECLARE vvStaffId              CHAR(38);
   DECLARE vvSlotId       CHAR(38);
    DECLARE vvDayOfWeek              DATE;
    DECLARE vvIsPermanent              BIT;
    DECLARE vvSubject              VARCHAR(50);
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATETIME;
    DECLARE vvCurrDate              DATE;
    
    
    
    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
	SET vvRunDate = vStartDate;
 
 
	 IF (vEndDate IS NULL) THEN
	 BEGIN
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   
		
	 
	END;	
	END IF;
	
	SELECT vvRunDate, vStartDate, vEndDate;
 	
 	SELECT 
	CASE WHEN vDayofWeek = 'Sun' THEN 1
	 WHEN vDayofWeek = 'Mon' THEN 2
	 WHEN vDayofWeek = 'Tue' THEN 3
	 WHEN vDayofWeek = 'Wed' THEN 4
	 WHEN vDayofWeek = 'Thu' THEN 5
	 WHEN vDayofWeek = 'Fri' THEN 6
	 WHEN vDayofWeek = 'Sat' THEN 7 END
	 INTO vvDayNumDB;
	 
	 
	
	SET vvDayOfWeek = vDayofWeek;
	SET vvSlotId = vSlotID;
	SET vvStaffId = vStaffID;
	-- SET vvIsPermanent = vIsPermanent;
	SET vvSubject = vSubject;
 	
 	
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	
        IF vvRunDate < vStartDate THEN
        BEGIN
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		
	END;
	END IF;
	WHILE (vEndDate >= vvRunDate) 
        DO 
        
		
		UPDATE
		  `staffassignment`
		SET
		  `Status` = cINACTIVE,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp,
		  `EndDate` = vvCurrDate
		WHERE StaffID = vvStaffiD  
		AND SlotID = vvSlotID AND DATE = vvRunDate;
		
		
        
		SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      
        END WHILE;
        
        
 
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStudentSlot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStudentSlot`(
	IN vStudentSlotAssignmentRequestID CHAR (38),
	IN vUserID CHAR(38)
)
BEGIN
	
	
	
		DECLARE cPROCESSED VARCHAR(50);
		DECLARE cPENDING VARCHAR(50);
		DECLARE cACTIVE VARCHAR(50);
		DECLARE cINACTIVE VARCHAR(50);
	
		DECLARE vvStudentId              CHAR(38);
		DECLARE vvSlotId       CHAR(38);
		DECLARE vvDayOfWeek              VARCHAR(50);
		DECLARE vvIsPermanent              BIT;
		DECLARE vvSubject              VARCHAR(50);
		DECLARE vvRequestStartDate DATE;
		DECLARE vvRequestEndDate DATE;
		DECLARE vvRequestType VARCHAR(50);
		DECLARE vvDone INT;
		DECLARE vvStudentSlotAssignmentRequestID CHAR(38);
		DECLARE vvStudentSlotAssignmentRequestDetailID CHAR(38);
		DECLARE vvCurrTimeStamp DATETIME;	
		DECLARE vvCurrDate DATETIME;	
		DECLARE vvLoopCounter INT;	
	
		
		
	        	
		DECLARE curStudentSlotAssignment CURSOR FOR 
		SELECT  ssar.StudentSlotAssignmentRequestID, ssard.StudentSlotAssignmentRequestDetailID, ssar.StudentID, ssar.Subject, ssard.DayOfWeek, 
			ssard.slotID, ssar.RequestStartDate, ssard.RequestType,  ssar.RequestEndDate, ssar.IsPermanent
		FROM studentslotassignmentrequest ssar 
		JOIN studentslotassignmentrequestdetail ssard ON ssar.`StudentSlotAssignmentRequestID` = ssard.`StudentSlotAssignmentRequestID`
		WHERE ssar.`StudentSlotAssignmentRequestID` = vStudentSlotAssignmentRequestID ORDER BY ssard.RequestType DESC;
		
		
		
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET vvDone=1;
		
		SET vvDone = 0;		
			
		SET cACTIVE = 'Active';	
	        SET cINACTIVE = 'Inactive';
		SET cPROCESSED = 'PROCESSED';
		SET cPENDING = 'PENDING';
		SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	        SET vvCurrDate = CURDATE();
	
		    
		    SELECT 'before cursor';
		    OPEN curStudentSlotAssignment;
		
		
		SET vvLoopCounter = 1;
		
		assignLoop: REPEAT
	
		FETCH curStudentSlotAssignment INTO 
			vvStudentSlotAssignmentRequestID, vvStudentSlotAssignmentRequestDetailID, vvStudentID, vvSubject, vvDayOfWeek, 
			vvSlotID, vvRequestStartDate, vvRequestType, vvRequestEndDate, vvIsPermanent;
		
		IF vvDone = 1 THEN
			LEAVE assignLoop;
		END IF;
		
		
			
			SELECT 'in cursor', vvLoopCounter, vvDone, vvRequestType, vvStudentSlotAssignmentRequestDetailID, vvDayOfWeek;
			
		IF (vvRequestType = 'ADD') THEN
		BEGIN
		CALL sp_AssignStudentSlotAdd (vvStudentID, vvSubject, vvDayofWeek,  vvSlotID, vvIsPermanent, vvRequestStartDate,vvRequestEndDate, vUserId );
		END;
		ELSEIF (vvRequestType = 'REMOVE') THEN
		BEGIN
			CALL sp_AssignStudentSlotRemove (vvStudentID, vvSubject, vvDayofWeek,  vvSlotID, vvIsPermanent,  vvRequestStartDate,vvRequestEndDate, vUserId );
		
		END;
		END IF;
		
		SELECT 'before update';
		UPDATE
		  `studentslotassignmentrequestdetail`
		SET
		  `Status` = cPROCESSED,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp
		WHERE StudentSlotAssignmentRequestDetailID = vvStudentSlotAssignmentRequestDetailID;
		
		
		SELECT 'after update';
		
		
		SET vvLoopCounter = vvLoopCounter + 1;	
			
		
		UNTIL vvDone END REPEAT assignLoop;
		
		
		
		SELECT 'out of cursor';
			
		UPDATE
		  `studentslotassignmentrequest`
		SET
		  `Status` = cPROCESSED,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp
		WHERE StudentSlotAssignmentRequestID = vvStudentSlotAssignmentRequestID;
		
		SELECT 'before closing';
		CLOSE curStudentSlotAssignment;
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStudentSlotAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStudentSlotAdd`(
    
  IN vStudentID CHAR(38),
  IN vSubject varCHAR(50),
  IN vDayofWeek VARCHAR(50),
  IN vSlotID CHAR(38),
  IN vIsPermanent BIT,
  IN vStartDate              DATE,
  IN vEndDate                DATE,    
  IN vUserId                 VARCHAR(40)
    
    )
BEGIN
DECLARE cACTIVE VARCHAR(50);
DECLARE cINACTIVE VARCHAR(50);
 DECLARE vvDummy              INT;
 DECLARE vvRunDate              DATE;
  DECLARE vvStudentId              CHAR(38);
   DECLARE vvSlotId       CHAR(38);
    DECLARE vvDayOfWeek              VARCHAR(50);
    DECLARE vvIsPermanent              BIT;
    DECLARE vvSubject              VARCHAR(50);
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATETIME;
    DECLARE vvCurrDate              DATE;
    
    DECLARE vvUUID char (38);
    
    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
	SET vvRunDate = vStartDate;
 
 
	 IF (vEndDate IS NULL) THEN
	 BEGIN
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   
		
	 
	END;	
	END IF;
	
	SELECT 'point 1', vvRunDate, vStartDate, vEndDate, vDayofWeek;
	SELECT 
	CASE WHEN vDayofWeek = 'Sun' THEN 1
	 WHEN vDayofWeek = 'Mon' THEN 2
	 WHEN vDayofWeek = 'Tue' THEN 3
	 WHEN vDayofWeek = 'Wed' THEN 4
	 WHEN vDayofWeek = 'Thu' THEN 5
	 WHEN vDayofWeek = 'Fri' THEN 6
	 WHEN vDayofWeek = 'Sat' THEN 7 END
	 INTO vvDayNumDB;
	 
	 
	 
	 select 'pt 2', vIsPermanent, vvDayNumDB;
	
	set vvDayOfWeek = vDayofWeek;
	SET vvSlotId = vSlotID;
	SET vvStudentId = vStudentID;
	
	SET vvIsPermanent = vIsPermanent;
	
	SET vvSubject = vSubject;
	-- Insert a row into StudentAssignmentTemplate
	set vvUUID = UUID();
	SELECT 'pt 3', vvUUID;
	INSERT INTO `studentassignmenttemplate` (
	  `StudentAssignmentID`,
	  `DayOfWeek`,
	  `SlotID`,
	  `StudentID`,
	  `IsPermanent`,
	  `Subject`,
	  `CreatedBy`,
	  `CreatedOn`,
	  `Status`,
	  `StartDate`,
	  `EndDate`
	)
	VALUES
	  (
	    vvUUID,
	    vvDayOfWeek,
	    vvSlotID,
	    vvStudentID,
	    vvIsPermanent,
	    vvSubject,
	    vUserID,
	    vvCurrTimeStamp,
	    cActive, 
	    vStartDate,
	    vEndDate
	  );
	
	-- select vvDayNumDB;
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	SELECT 'before', vvRunDate, vvDayNumDB;
	-- select vvRunDate;
	
        IF vvRunDate < vStartDate THEN
        BEGIN
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		SELECT 'in if 1', vvRunDate;
		-- SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
		SELECT 'in if 2', vvRunDate;
	END;
	END IF;
        SELECT 'out of if', vvRunDate; 
	WHILE (vEndDate >= vvRunDate) 
        DO 
        
			-- SELECT vvRunDate;
		
        
        
        
        -- todo: Check if for the same student, same day, same subject and same slot with status = "active" then don't do anything
        
			INSERT INTO `studentcenterslot` (
			  `StudentCenterSlotID`,
			  `StudentID`,
			  `Subject`,
			  `Date`,
			  `SlotID`,
			  `CreatedBy`,
			  `CreatedOn`,
			  `Status`,
			  `StartDate`
			)
			VALUES
			  (
			    UUID(),
			    vvStudentID,
			    vvSubject,
			    vvRunDate,
			    vvSlotID,
			    vUserId,
			    vvCurrTimeStamp,
			    cActive , 
			    vvCurrDate
			  );
			  
        
		SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      
        END WHILE;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AssignStudentSlotRemove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_AssignStudentSlotRemove`(
    
 IN vStudentID CHAR(38),
  IN vSubject VARCHAR(50),
  IN vDayofWeek VARCHAR(50),
  IN vSlotID CHAR(38),
  IN vIsPermanent BIT,
  IN vStartDate              DATE,
  IN vEndDate                DATE,    
  IN vUserId                 VARCHAR(40)
  
    )
BEGIN

DECLARE cACTIVE VARCHAR(50);

DECLARE cINACTIVE VARCHAR(50);


 DECLARE vvDummy              INT;
 DECLARE vvRunDate              DATE;
  DECLARE vvStudentId              CHAR(38);
   DECLARE vvSlotId       CHAR(38);
    DECLARE vvDayOfWeek              DATE;
    DECLARE vvIsPermanent              BIT;
    DECLARE vvSubject              VARCHAR(50);
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATETIME;
    DECLARE vvCurrDate              DATE;
    
    
    

    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
	SET vvRunDate = vStartDate;
 
 
	 IF (vEndDate IS NULL) THEN
	 BEGIN
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   

		
	 
	END;	
	END IF;
	
	SELECT vvRunDate, vStartDate, vEndDate;


 	
 	SELECT 
	CASE WHEN vDayofWeek = 'Sun' THEN 1
	 WHEN vDayofWeek = 'Mon' THEN 2
	 WHEN vDayofWeek = 'Tue' THEN 3
	 WHEN vDayofWeek = 'Wed' THEN 4
	 WHEN vDayofWeek = 'Thu' THEN 5
	 WHEN vDayofWeek = 'Fri' THEN 6
	 WHEN vDayofWeek = 'Sat' THEN 7 END
	 INTO vvDayNumDB;
	 
	 
	
	SET vvDayOfWeek = vDayofWeek;
	SET vvSlotId = vSlotID;
	SET vvStudentId = vStudentID;
	-- SET vvIsPermanent = vIsPermanent;
	SET vvSubject = vSubject;
 	
 	
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	
        IF vvRunDate < vStartDate THEN
        BEGIN
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		
	END;
	END IF;

	WHILE (vEndDate >= vvRunDate) 
        DO 
        
		
		UPDATE
		  studentcenterslot
		SET
		  `Status` = cINACTIVE,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp,
		  `EndDate` = vvCurrDate
		WHERE StudentID = vvStudentiD AND SUBJECT = vvSubject 
		AND SlotID = vvSlotID AND DATE = vvRunDate;

		
		
        
		SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      


        END WHILE;
        begin
        
        UPDATE
		  studentassignmenttemplate
		SET
		  `Status` = cINACTIVE,
		  `UpdatedBy` = vUserId,
		  `UpdatedOn` = vvCurrTimeStamp,
		  `EndDate` = vvCurrDate
		WHERE StudentID = vvStudentiD AND SUBJECT = vvSubject 
		AND SlotID = vvSlotID AND DAYOFWEEK  = vvDayOfWeek;         
        
        end;
        
        



 




	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConceptOrCorrectionPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_ConceptOrCorrectionPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
  if (vAction = 'CWtoConcept') then
    
    /* Call */
    call `sp_ConceptorCorrection_CWtoConceptorCorrectionPlanning`(null, vLPAssignmentHeaderID, vDate, vUserId);
    
  end if;
  
  
  IF (vAction = 'ConceptToCW') THEN
   
    /* Call */
    CALL `sp_ConceptorCorrectionToCWPlanning`(null, vLPAssignmentHeaderID, vDate, vUserId);
    
  END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConceptorCorrection_CWtoConceptorCorrectionPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_ConceptorCorrection_CWtoConceptorCorrectionPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLessonPlanScoreAssignmentID   
                             CHAR(38),
  IN vDate                   DATE,
  IN vUserId                 VARCHAR(40)
  
)
BEGIN
  /* Declare the variables here */
  
  declare vMsg                       varchar(500);
  DECLARE vNextCWDay                 DATE;
  DECLARE cCWWorkType                VARCHAR(10);
  declare vvCurrWorkType             VARCHAR(10);
  DECLARE vvStudentId                CHAR(38);
  DECLARE vvSubject                  VARCHAR(50);
  DECLARE vvTotalWSCount             INT;
  DECLARE vvTotalWSCountConcept      INT;
  DECLARE vvTotalWSCountCorrection   INT;
  DECLARE vvCompletedWSCount         INT;
  DECLARE vvPerecntageToComplete     decimal(5,2);
  declare vvTotalSheetsScore         decimal(5,2);
  DECLARE vvDurationDays             INT;
  DECLARE vvNoOfDaysToCountWS        INT;
  
  declare vvStartWSNo                int;
  DECLARE vvEndWSNo                  INT;
  
  DECLARE vvLevelEnd                 int;
  declare vvWSCompletedPerc          decimal(5,2);
  declare cTriangle                  varchar(50);
  declare vvObtainedScore            decimal(5,2);
  declare vvLastConceptDay           Date;
  DECLARE vvLastCorrectionDay        DATE;
  declare cConcept                   varchar(25);
  declare cCorrection                varchar(25);
  declare vvDateDiffCCs              int;
  declare vvConceptDurationDays      int;
  
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
 
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvLessonPlanScoreAssignmentID CHAR(38);
  DECLARE vvStartWSNumForAbsent      INT;
  declare vvConceptPerc              decimal(5,2);
  declare vvCorrectionPerc           DECIMAL(5,2);
  declare vvNoOfTriangleDays         int;
  DECLARE vvNoOfSixToSevenDays       INT;
  
  DECLARE vvNoOfTriangleDaysPerc     Decimal(5,2);
  DECLARE vvNoOfSixToSevenDaysPerc   DECIMAL(5,2);
  
  DECLARE vvCorrectioDurationDays       INT;    
  DECLARE vvNoOfDaysToCountWSConcept    INT; 
  DECLARE vvNoOfDaysToCountWSCorrection   INT;
  declare vvDateDiffConceptDay         int;
  DECLARE vvDateDiffCorrectionDay         INT;
  
  
  
  
  
  DROP TABLE IF EXISTS ttWorksheetRange;  
  
  CREATE TEMPORARY TABLE ttWorksheetRange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);                                  
 
 
  /* Initialize the variables here */
  SET vvPerecntageToComplete      = 80,   /* It should be sys param */
      
      vvConceptDurationDays       = 7,
      vvCorrectioDurationDays     = 7,     /* It should be sys param */
      
      vvNoOfDaysToCountWSConcept      = 5,    /* It should be sys param */
      vvNoOfDaysToCountWSCorrection   = 5,
      
      vvConceptPerc               = 60,
      vvCorrectionPerc            = 80,
      
      cActive                     = 'Active', 
      cTriangle                   = 'Triangle',
      cConcept                    = 'Concept',
      cCorrection                 = 'Correction',
      cInActive                   = 'InActive',
      vvIsPlanFinished            = 0,
      vvCurrDate                  = CURRENT_TIMESTAMP,
      vvIsAssessmentDoneonCW      = 0,
      cAssessment                 = 'Assessment',
      cReviewPacket               = 'Review Packet',
      cCWWorkType                 = 'CW',
      cHWWorkType                 = 'HW',
      vvStartCWLoop               = 1,
      cAbsent                     = 'Absent',
      vvSysMsg                    = 'Work can be done on Class only';
  
     
  
  /* Fetch the requred fields data here based on given input data */
  SELECT `StudentID`, `Subject`
  INTO   vvStudentId, vvSubject
  FROM `lessonplanscoreassignment`
  WHERE `LessonPlanScoreAssignmentID` = vLessonPlanScoreAssignmentID;
  
  
  SELECT `Date`
  INTO vNextCWDay
  FROM `lessonplanscoreassignment`
  WHERE `StudentID`    = vvStudentId  AND 
        `Subject`      = vvSubject    AND
        `WorkType`     = cCWWorkType  AND 
        `Date` >         vDate
  order by Date limit 1;
  

  SELECT `Date`
  INTO vvLastConceptDay 
  FROM`lessonplanscoreassignment`
  WHERE `WorkType`        = cCWWorkType  AND
        `SpecialActivity` = cConcept     AND
        `StudentID`       = vvStudentId  AND 
        `Subject`         = vvSubject    AND 
        `Status`          = cActive      AND
        `Date`           <= vDate
  ORDER BY `Date` DESC LIMIT 1; 
  
  SELECT `Date`
  INTO vvLastCorrectionDay 
  FROM`lessonplanscoreassignment`
  WHERE `WorkType`        = cCWWorkType  AND
        `SpecialActivity` = cCorrection     AND
        `StudentID`       = vvStudentId  AND 
        `Subject`         = vvSubject    AND 
        `Status`          = cActive      AND
        `Date`           <= vDate
  ORDER BY `Date` DESC LIMIT 1; 
  
  
  SELECT IfNull(DATEDIFF(vNextCWDay, vvLastConceptDay), 999)
  INTO vvDateDiffConceptDay;
  
   
  
  SELECT ifnull(DATEDIFF(vNextCWDay, vvLastCorrectionDay), 999)
  INTO vvDateDiffCorrectionDay;
  
  SELECT COUNT(*)
  INTO vvTotalWSCount
  FROM `worksheetscore`
  WHERE `Status`       = cActive      AND
        `StudentID`    = vvStudentId  AND 
        `Subject`      = vvSubject    AND 
        CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL -vvNoOfDaysToCountWSConcept+1  DAY) AND vDate;
  
  
  SELECT COUNT(*)
  INTO vvTotalWSCountConcept
  FROM `worksheetscore`
  WHERE `Status`       = cActive      AND
        `StudentID`    = vvStudentId  AND 
        `Subject`      = vvSubject    AND 
        IFNULL(`Score`, 0)   = 5     AND 
        CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL -vvNoOfDaysToCountWSConcept+1  DAY) AND vDate;
        
  SELECT COUNT(*)
  INTO vvTotalWSCountCorrection
  FROM `worksheetscore`
  WHERE `Status`       = cActive      AND
        `StudentID`    = vvStudentId  AND 
        `Subject`      = vvSubject    AND 
        IFNULL(`IsFixed`, 0) = 0     AND
        (IFNULL(`Score`, 0) >= 5     AND IFNULL(`Score`, 0) < 7)   AND
        CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL -vvNoOfDaysToCountWSCorrection+1  DAY) AND vDate;
  
  
  
  select count(*)
  into vvNoOfTriangleDays
  from `worksheetscore`
  where `StudentID`    = vvStudentId and 
        `Subject`      = vvSubject   and 
        `Status`       = cActive     and
        IfNull(`Score`, 0)   = 5     and 
        IFNULL(`IsFixed`, 0) = 0     AND
        CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL -vvNoOfDaysToCountWSConcept+1  DAY) AND vDate;
        
        
  
  
  if ((vvNoOfTriangleDays/vvTotalWSCount)*100 >= vvConceptPerc) and 
     (vvDateDiffConceptDay > vvConceptDurationDays)  then
    set vAction = 'Concept';
  end if;
    
  
  IF (vAction is null) then
  
    SELECT COUNT(*)
      INTO vvNoOfSixToSevenDays
      FROM `worksheetscore`
      WHERE `StudentID`    = vvStudentId AND
        `Subject`      = vvSubject   AND 
        `Status`       = cActive     AND
        (IFNULL(`Score`, 0) >= 5     AND IFNULL(`Score`, 0) < 7)   AND 
        IFNULL(`IsFixed`, 0) = 0     AND
        CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL -vvNoOfDaysToCountWSCorrection+1  DAY) AND vDate;
        
        
  end if;   
    
      
  IF (vAction IS NULL) and ((vvNoOfSixToSevenDays/vvTotalWSCount)*100 >= vvCorrectionPerc) and 
     (vvDateDiffCorrectionDay > vvCorrectioDurationDays)THEN
           SET vAction = 'Correction';
        

  END IF; 
  
  
  SELECT `Level`
  INTO   vvLevelStart
  FROM `worksheetscore`
  WHERE `Status`        = cActive AND 
        `StudentID`     = vvStudentId  AND 
        `Subject`       = vvSubject     AND
       cast(`WorksheetDate` as date) = vDate 
  order by `WorksheetDate` limit 1;
  
  
  
 /* select COUNT(*)
  into vvTotalSheetsScore
  FROM `worksheetscore` WS
  WHERE (CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL - vvNoOfDaysToCountWS+1  DAY) AND vDate) AND
        (WS.`StudentID`     = vvStudentId)   AND
        (WS.Subject         = vvSubject)     AND
        (WS.Status          = cActive)       AND
        (WS.`IsIncomplete`  = 0)             AND 
        (WS.Status          = cActive); */
  
   
 
  /* select count(*)
  into vvCompletedWSCount 
  from `worksheetscore` 
  where (`StudentID`      =  vvStudentId)  and
        (`Subject`        =  vvSubject)    and 
        (`IsIncomplete`   =  0)            and 
        (`Level`          =  vvLevelStart)    and 
        (CAST(`WorksheetDate` AS DATE) BETWEEN DATE_ADD((vDate),INTERVAL - vvNoOfDaysToCountWS+1  DAY) AND vDate) AND
        (`Status`         =  cActive);     
        
  select (vvTotalWSCount/vvCompletedWSCount)*100
  into vvWSCompletedPerc; */
  
  insert into `tmp_debug` (`Message`)
                     select 'CWToCOncept'
UNION select concat(vvNoOfTriangleDays                 ,'vvNoOfTriangleDays            ')                   
union select concat(vvNoOfSixToSevenDays               ,'vvNoOfSixToSevenDays          ')
union select concat(vvTotalWSCountConcept              ,'vvTotalWSCountConcept         ')
union select concat(vvConceptPerc                      ,'vvConceptPerc                 ')
union select concat(vvCorrectionPerc                   ,'vvCorrectionPerc              ')
union select concat(vvDateDiffConceptDay               ,'vvDateDiffConceptDay          ')
union select concat(vvConceptDurationDays              ,'vvConceptDurationDays         ')
union select concat(vvNoOfSixToSevenDays               ,'vvNoOfSixToSevenDays          ')
union select concat(vvNoOfDaysToCountWSCorrection      ,'vvNoOfDaysToCountWSCorrection ')
union select concat(vvNoOfSixToSevenDays               ,'vvNoOfSixToSevenDays          ')
union select concat(vvTotalWSCountCorrection           ,'vvTotalWSCountCorrection      ')
union select concat(vvNoOfTriangleDaysPerc             ,'vvNoOfTriangleDaysPerc        ')
union select concat(vvNoOfSixToSevenDaysPerc           ,'vvNoOfSixToSevenDaysPerc      ')
union select concat(vvTotalWSCountConcept              ,'vvTotalWSCountConcept         ')
union select concat(vvTotalWSCountCorrection           ,'vvTotalWSCountCorrection      ')


                       
                      union select CONCAT('vAction', vAction) ; 
  
  
ExitHandler: BEGIN
  /* Do the validations here */
  IF (vAction IS NULL or vAction = 'No Action Required') THEN
    SET vMsg = 'Concept or Correction is not required as required scored';
    LEAVE ExitHandler;
  END IF;
  IF (vNextCWDay IS NULL) THEN
    SET vMsg = CASE WHEN vNextCWDay IS NULL THEN 'There is no future class work' END;
    LEAVE ExitHandler;
  END IF;
  
  /* if (vvPerecntageToComplete > vvWSCompletedPerc) then
    SET vMsg =  'No Of Completed work sheets are less than required'; 
    LEAVE ExitHandler;
  END IF; 
  
   IF (vvLastConceptDay is not null and vvDateDiffCCs > vvConceptDurationDays) THEN
    SET vMsg =  'Unable to process correction or concept since concept day was done recently'; 
    LEAVE ExitHandler;
  END IF;  */
  
  
  if (exists (select 1 from `worksheetscore` WS where (WS.`WorksheetDate`    = vDate)   and 
                                                      (WS.`Status`           = cActive) and
                                                      (WS.`Score`            is null     or
                                                     --  ifnull(WS.`Score`, 0)            = 0         or
                                                       WS.`IsIncomplete`     = 1))) then
    SET vMsg = 'Score can be given for all the sheets on the given class date'; 
    LEAVE ExitHandler;
  end If; 
  
  
  
  if (vAction in ('Correction', 'Concept')) then
  
 
    
   set vDate = vNextCWDay;
   
      
  SELECT `WorksheetNum` +1
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   <= date_add(vNextCWDay, interval -1 day)  AND 
        `Status`          = cActive
  ORDER BY `WorksheetDate` desc, `WorksheetNum` desc LIMIT 1;
  
  
      
     /* Update the status to inactive as we need to re plan everything from given date onwards */
     UPDATE `lessonplanscoreassignment` LP
     SET LP.`UpdatedBy`  = vUserId,
         LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
         LP.`Status`     = cInActive
     WHERE (LP.`StudentID` =  vvStudentID) AND
           (LP.`Subject`   = vvSubject)    AND
           (LP.`Status`    = cActive)      AND
           (LP.`WorkType`  not in ('AW'))  and
           (LP.`Date` >= vNextCWDay);   
  
  UPDATE `worksheetscore` LP
     SET LP.`UpdatedBy`  = vUserId,
         LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
         LP.`Status`     = cInActive
     WHERE (LP.`StudentID` =  vvStudentID) AND
           (LP.`Subject`   =  vvSubject)    AND
           (LP.`Status`    =  cActive)      AND
           (LP.`WorksheetDate` >= vNextCWDay);   
  
  
  /* SELECT `Level`
  INTO vvLevelStart
      FROM `worksheetscore` LP
        JOIN StringMap S ON S.`StringMapName` = LP.`Level` AND 
                            S.`StringMapType` = vvSubjectLevel
      WHERE LP.`Status`    = cActive      AND 
            LP.`StudentID` = vvStudentID  AND 
            LP.`Subject`   = vvSubject
      ORDER BY S.SortOrder DESC LIMIT 1; */
     
     
      /* Fetch the StartTime and EndTime */
      SELECT S.`StartTime`, S.`EndTime`
      INTO   vvStartTime,   vvEndTime                 
      from `studentcenterslot`  SS 
        JOIN  `slot`  S  ON (S.`SlotID`  = SS.`SlotID`)                                              
      WHERE (SS.`StudentID` = vvStudentID)   AND 
            (SS.`Subject`   = vvSubject)  AND
            (CAST(SS.`Date` AS DATE)  = vDate)
            limit 1; 
                                                
      
    
      INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                               `FromTime`, `ToTime`, `Notes`, `SpecialActivity`, `CreatedBy`, `UpdatedBy`,`CreatedOn`, 
                                               `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                         SELECT UUID(), vvStudentID, vvSubject, vDate, cCWWorkType, vvStartTime, 
                                                vvEndTime, Null, vAction, vUserId, NULL, CURRENT_TIMESTAMP, NULL, 
                                                cActive, CURDATE(), NULL;
                                                    
      /* Fetch the End of the year date against given date for 
         processing lesson plan till end of the year         */  
      SET vvEndDate       = CONCAT(YEAR(vDate), '-12-31'),
          vvSubjectLevel  = CONCAT(vvSubject, 'Level'),
          vDate           = DATE_ADD((vDate),INTERVAL 1 DAY);  
  
  
  
      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType                     = NULL,
              vvNoOfWSOfTheDay               = NULL,
              vvWorksheetRangeEnd            = NULL,
              vvWorksheetRangeStart          = NULL,
              vvPrevDayWSNo                  = NULL,
              vvIsAssessmentDoneonCW         = 0,
              vvWSEndNo                      = NULL,
              vvStartTime                    = NULL,
              vvIsHoliday                    = NULL, 
              vvHolidayDesc                  = NULL,
              vvEndTime                      = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`,      `WSEndNo`, SL.`WSStartNo`  
          INTO   vvWorkType,    vvNoOfWSOfTheDay, vvWSEndNo, vvWorksheetRangeStart
          FROM `lpworksheetassignment` LW
            LEFT JOIN `studentsubjectlevel`  SL  ON LW.`StudentID` = SL.`StudentID` AND 
                                                    LW.`Subject`   = SL.`Subject`   AND
                                                    SL.`Level`     = vvLevelStart 
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject   )  AND 
                (LW.`StudentID`    = vvStudentID )  AND
                (LW.`Status`       = cActive     )  
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                       
          SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
          
                     
          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  <  vDate    
         ORDER BY  WS.`WorksheetDate` DESC, WS.`WorksheetNum` DESC
         LIMIT 1;
         
         
          IF(vvWorkType = cCWWorkType) THEN 
            BEGIN
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime 
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
                    limit 1;
            END;
            END IF;
            
            
             IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM holiday
             WHERE HolidayDate = vDate;
             
           END IF; 
          
          
          /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR vvPrevDayWSNo = vvWSEndNo 
                                 THEN COALESCE(vvWorksheetRangeStart, 1) 
                      ELSE vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
          
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
          
          
          SET vvLessonPlanScoreAssignmentID = UUID(); 
                                
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                    `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     Null, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, 
                                                     CURDATE(), NULL;
                                                   
                                                     
           IF(vvWorkType IS NOT NULL) THEN
            
                CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
                CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
             END IF;   
           
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                   SET vvWorkType                    = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
                   
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                  WHERE (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND
                        (LW.`WorkType` IN   ('CW', 'HW' ))                  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                         limit 1;
                
         IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM holiday
             WHERE HolidayDate = vDate;
             
          END IF; 
                
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 0, 0,Null, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                      
                      
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, 
                                                                 `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, 
                                                                  vDate, cAssessment, 0, 
                                                                  0, CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END, CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  Null, vUserId,NULL, 
                                                                  CURRENT_TIMESTAMP, NULL, cActive, 
                                                                  CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                              limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `SysMessage`, 
                                                                 `CreatedBy`, `UpdatedBy`, `CreatedOn`, 
                                                                 `UpdatedOn`, `Status`, `StartDate`, 
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, 
                                                                  vDate, cReviewPacket, 0, 
                                                                  0, null, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,  
                                                                  vUserId, NULL, CURRENT_TIMESTAMP, 
                                                                  NULL, cActive, CURDATE(), 
                                                                  NULL; 
                                                               
                      END; 
                    END IF;                   
                  
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
                        
           SET vvStartWSNumForAbsent = NULL;   
        
      END WHILE;
    
    
    END IF;
    
   
  END ExitHandler;
 
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GenerateNum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_GenerateNum`(
  IN vvWorksheetRangeStart       int,      
  IN vvWorksheetRangeEnd         int, 
  IN vvLevel                     VARCHAR(25)                 
      
)
BEGIN
  
  delete from ttWorksheetRange;
  
  while (vvWorksheetRangeEnd >= vvWorksheetRangeStart)
  do
   
   insert into ttWorksheetRange (LEVEL,   WorksheetNum)
                          select vvLevel, vvWorksheetRangeStart;
                          

  set vvWorksheetRangeStart = vvWorksheetRangeStart + 1;
  
  end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAdditionalWorkByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_GetAdditionalWorkByDate`(
  IN  vAction                 VARCHAR(50),
  IN  vLPAssignmentHeaderID   char(38),
  IN  vDate                   DATE,
  IN  vLevelStart             varchar(25),  
  IN  vUserId                 char(38)
)
BEGIN
  declare cActive                    varchar(50);
  DECLARE cAWWorkType                VARCHAR(50);
  DECLARE cWorkType                  VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvSubject                  VARCHAR(50);
  declare vvAdditionalWorkNote       text;
  
 
  set cActive       = 'Active',
      cAWWorkType   = 'AW';
      
      
 
  select `WorkType`, `Note`, `StudentID`, `Subject`
  into   cWorkType, vvAdditionalWorkNote, vvStudentID, vvSubject 
  FROM `lpworksheetassignment`
  WHERE `DayOfWeek`            = SUBSTRING(DAYNAME(vDate), 1, 3) AND 
        `LPAssignmentHeaderID` = vLPAssignmentHeaderID           AND
        `WorkType`             = cAWWorkType                     AND 
        `Status`               = cActive;
        
   IF(cWorkType = cAWWorkType) THEN
     update `lessonplanscoreassignment`   
     set `Notes` = vvAdditionalWorkNote
     where `StudentID`  = vvStudentId and 
           `Subject`    = vvSubject   and
           `Date`       = vDate       and
           `Status`     = cActive;
                                       
    END IF; 
                                                         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertWorksheetAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_InsertWorksheetAssignment`(
  IN vLessonPlanScoreAssignmentID  char(38),
  IN vUserId                       CHAR(38)        
)
BEGIN

  
  DECLARE vvSubject                  VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvDate                     date;
  declare vvLevel                    varchar(25);
  declare vvWorkSheetNum             int;
  declare vvSortOrder                int;
  declare vRecordId                  int;
  declare cActive                    varchar(50);
  
  
  set cActive    = 'Active',
      vRecordId  = 0;
  
  select `StudentID`, `Subject`, `Date`
  into   vvStudentID, vvSubject, vvDate
  from `lessonplanscoreassignment`
  where `LessonPlanScoreAssignmentID` = vLessonPlanScoreAssignmentID
  limit 1;



  while (exists(select 1 from ttWorksheetRange where RecordId > vRecordId))
  do
  
  
      select LEVEL, WorksheetNum, RecordId 
      into vvLevel, vvWorkSheetNum, vRecordId
      from ttworksheetrange
      WHERE RecordId > vRecordId
      limit 1;
      
        
  
    if (not exists(select 1 from `worksheetscore` where `StudentID`       = vvStudentID and
                                                        `Subject`         = vvSubject   and
                                                        `Level`           = vvLevel     and
                                                        `WorksheetDate`   = vvDate      and
                                                        `Status`          = cActive)) then
                                                        
      set vvSortOrder = 1;
      
   else
     
     select `SortOrder` + 1
     into    vvSortOrder
     from `worksheetscore` 
     WHERE `StudentID`       = vvStudentID AND
           `Subject`         = vvSubject   AND
           `Level`           = vvLevel     AND
           `WorksheetDate`   = vvDate      AND
           `Status`          = cActive
     order by `SortOrder` desc limit 1;
     
    end if;
    
    
    insert into `worksheetscore` (`WorksheetScoreID`,`LessonPlanScoreAssignmentID`,`StudentID`,
                                  `Subject`,`Level`,`WorksheetNum`,`WorksheetDate`,`SortOrder`,
                                  `CreatedBy`,`CreatedOn`,`Status`)
                           select  UUID(), vLessonPlanScoreAssignmentID, vvStudentID, vvSubject,
                                   vvLevel, vvWorkSheetNum, vvDate, vvSortOrder, vUserId, current_timestamp,
                                   cActive;
     
     
  
  
  end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_lpassignmentheader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_insert_lpassignmentheader`(
 
  in LPAssignmentHeaderID char(38),
  in StudentID CHAR(38),
  In LPAssignmentDate date,
  In Subject varchar(50),
  IN RequestType varchar(50),
  IN StartingLevel VARCHAR(50),
  In StartingWorkSheetNum int(11),
  IN WSStartDate Date,
  IN CreatedBy char(38),
  IN CreatedOn Datetime,
  IN Status varchar(50),
  IN StartDate Date,
  IN EndDate date
)
BEGIN
  insert into lpassignmentheader(LPAssignmentHeaderID, StudentID,LPAssignmentDate,Subject,RequestType,
  StartingLevel,StartingWorkSheetNum,StartingWorkSheetNum,WSStartDate,CreatedBy,CreatedOn,STATUS,StartDate,EndDate)
  
  values(LPAssignmentHeaderID, StudentID,LPAssignmentDate,SUBJECT,RequestType,
  StartingLevel,StartingWorkSheetNum,StartingWorkSheetNum,WSStartDate,CreatedBy,CreatedOn,STATUS,StartDate,EndDate);
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_LessonPlanScoreAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_LessonPlanScoreAssignment`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
  /* Declare local variables here */
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50);
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cActive                    VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  declare vvStartTime                time;
  declare vvEndTime                  Time;
  declare vvIsHoliday                Bit;
  Declare vvHolidayDesc              varchar(200);
  declare vvLessonPlanScoreAssignmentID 
                                     char(38);
  declare vvReqEndDate               Date;                                     
  
  DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      int AUTO_INCREMENT PRIMARY KEY,
                                           Level         varchar(25),
                                           WorksheetNum  int);
  
  
  /* Initialize the varibale here */
  SET vvIsAssessmentDoneonCW     = 0;
  SET cAssessment      =  'Assessment';
  SET cReviewPacket    =  'Review Packet';
  SET cActive          =  'Active';  
 
  /* Fetch the header data */
  SELECT LH.`StudentID`,LH.`Subject`,LW.`WorkType`, SL.`Level`, SL.`WSStartNo`, LW.`NoOfWS`, 
         LH.`RequestType`,  COALESCE(LH.`RequestEndDate`, CONCAT(YEAR(LH.`RequestStartDate`), '-12-31')),
         LH.`RequestStartDate`
  INTO vvStudentID, vvSubject, vvWorkType, vvLevelStart, vvStartingWorkSheetNum, vvNoOfWS, 
       vvRequestType, vvReqEndDate , vDate             
  FROM `lpassignmentheader`   LH 
   left  JOIN  `lpworksheetassignment` LW  ON (LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`) and
                                              (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))      AND
                                              (`WorkType` IN ('CW', 'HW' ))
   LEFT JOIN  `studentsubjectlevel`   SL   ON (LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`)
   left join  `studentcenterslot`     SS   on (LH.`StudentID`            = SS.`StudentID`) and 
                                              (LH.`Subject`              = SS.`Subject`)   and
                                              (cast(SS.`Date` as date)    >= vDate)
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  limit 1; 
  
  
 if (vvRequestType = 'Initial') then 
  /* Loop through all the dates till the end of the year from given date */
      WHILE (vvReqEndDate >= vDate) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = null,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW          = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = Null,
              vvIsHoliday           = NULL, 
              vvHolidayDesc         = NULL,
              vvEndTime             = Null;
              
       
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`,      SL.`WSEndNo`, SL.`WSStartNo`  
          INTO   vvWorkType,    vvNoOfWSOfTheDay, vvWSEndNo, vvWorksheetRangeStart
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID` and
                                               (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
           left JOIN `studentsubjectlevel`  SL  ON (LH.`StudentID`  = SL.`StudentID`)  and
                                                   (LH.`Subject`    = SL.`Subject`)    and
                                                   (SL.`Level`      = vvLevelStart)    
          WHERE (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
    
          
          SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart;
                      
          
          
          /* Get this from a variable */ 
          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'      
          ORDER BY  WS.`WorksheetNum` DESC LIMIT 1;
          
          select S.`StartTime`, S.`EndTime`
          into vvStartTime,     vvEndTime
          from `slot` S
            join `studentcenterslot` SS on S.`SlotID` = SS.`SlotID`
          where SS.`StudentID` = vvStudentId and 
                SS.Subject     = vvSubject   And
                cast(SS.`Date` as date)     = vDate
          limit 1;
                
           
          if(exists(select 1 from `holiday` where HolidayDate = vDate and Status = 'Active')) then
            
             select 1, HolidayDesc, 'HW' 
             into vvIsHoliday, vvHolidayDesc, vvWorkType
             from holiday
             where HolidayDate = vDate
             limit 1;
             
          end if;             
          
                      
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR vvPrevDayWSNo = vvWSEndNo THEN coalesce(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
                       
           
                   
           set vvLessonPlanScoreAssignmentID = UUID();
           
           
           INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     case when vvIsHoliday = 1 then vvHolidayDesc else Null end,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
         
        
          IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;               
         
         /* Insert Additional Work records if any. Below procedure will take care of this */            
           CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart,vUserId);
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                  SET vvWorkType            = NULL,
                      vvStartTime           = NULL,
                      vvIsHoliday           = NULL, 
                      vvHolidayDesc         = NULL,
                      vvEndTime             = NULL;                
                
                
                 SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                    JOIN `lpassignmentheader`  LH ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
                  WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                        (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         cast(SS.`Date` as date)     = vDate
                   limit 1;
                      
                    
                    IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                        SELECT 1, HolidayDesc, 'HW' 
                        INTO vvIsHoliday, vvHolidayDesc, vvWorkType
                        FROM holiday
                        WHERE HolidayDate = vDate;
             
                     END IF; 
                     
                    
                  
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `CreatedBy`, `UpdatedBy`, 
                                                                 `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW', 0, 0,vNotes, 
                                                                  vUserId,NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                                 `Notes`, `SysMessage`,  `SpecialActivity`, `CreatedBy`, 
                                                                 `UpdatedBy`, `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, 
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'CW',0, 0,vvStartTime, 
                                                                  vvEndTime, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                                  cAssessment, vUserId,NULL, CURRENT_TIMESTAMP, 
                                                                  NULL, cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive
                        limit 1;
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`
                        INTO  vvLevelStart 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     = vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
      
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`,`TimeTakenInSeconds`,
                                                                 `AdditionalWorkScore`, `Notes`, `SysMessage`, `SpecialActivity`,
                                                                 `CreatedBy`, `UpdatedBy`, `CreatedOn`, `UpdatedOn`, 
                                                                 `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'HW', 
                                                                  0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                                  cReviewPacket, vUserId,NULL, CURRENT_TIMESTAMP, NULL, 
                                                                  cActive, CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
                    /* Insert Additional Work records if any. Below procedure will take care of this */            
                    CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
                         
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvReqEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;   
        
      END WHILE;
      end if;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_LessPlanningAgainstWSChangeRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_LessPlanningAgainstWSChangeRequest`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  declare vvLatestLPAssignmentHeaderID
                                     CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvNewWSCount               INT;
  DECLARE vvSpecialActivity          VARCHAR(100);
  DECLARE vvRequestText              VARCHAR(100);
  DECLARE vvSysMessage               VARCHAR(100);       
  DECLARE vvFromTime                 TIME;
  DECLARE vvExtToTime                TIME;
  DECLARE vvWSCount                  INT;
  DECLARE vvExtSpecialActivity       VARCHAR(100);
  DECLARE vvExtRequestText           VARCHAR(100);
  DECLARE vvExtSysMessage            VARCHAR(100);
  DECLARE vvExtWorkType              VARCHAR(100);       
  DECLARE vvExtFromTime              TIME;
  
  
  DECLARE vvExtWSCount               INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vvIsPermanent              bit;
  DECLARE vSplActivityCode           VARCHAR(50);
  DECLARE vvLessonPlanScoreAssignmentID   
                                     CHAR(38);
  DECLARE vvStartWSNumForAbsent      INT; 
  
  DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);   
  
  
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  
  
                                  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, LH.`RequestStartDate`,
         LH.`IsPermanent`, LH.`RequestEndDate` 
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  limit 1;
  
  
  SELECT `WorksheetNum`
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   = vvReqStartDate AND 
        `Status`          = cActive
  ORDER BY `WorksheetNum` LIMIT 1;
  
  SELECT `LPAssignmentHeaderID`
  INTO   vvLatestLPAssignmentHeaderID
  FROM `lpworksheetassignment` lwa1 
  WHERE StudentID = vvStudentID AND 
        SUBJECT = vvSubject AND 
        IsPermanent = b'1' AND STATUS = cActive
          AND NOT EXISTS 
             (SELECT 1 FROM lpworksheetassignment lwa2 WHERE lwa2.studentid = lwa1.studentid AND 
                                                             lwa2.subject = lwa1.subject AND 
                                                             lwa2.IsPermanent = b'1' AND 
                                                             lwa2.status = 'Active'  AND 
                                                             lwa2.createdon > lwa1.createdon)
        LIMIT 1;
        
        
  
                                   
  SET vvEndDate        = CONCAT(YEAR(vDate), '-12-31');
  SET vvSubjectLevel   = CONCAT(vvSubject, 'Level');
  
  DROP TEMPORARY  TABLE  IF EXISTS tttemplpworksheetassignment;
   
   CREATE TEMPORARY TABLE tttemplpworksheetassignment (WorkType      VARCHAR(50), 
                                                         WeekDayName   VARCHAR(50),   
                                                         NoOfWS        INT,
                                                         Note          TEXT);
  if (vvIsPermanent = 1) then
    begin
    
    insert into `lpworksheetassignment` (`LPWorkSheetAssignmentID`, `LPAssignmentHeaderID`, `StudentID`, `Note`,
                                         `Subject`, `WorkType`, `DayOfWeek`, `NoOfWS`, `IsPermanent`, `CreatedBy`,
                                         `CreatedOn`, `Status`)
                                   select UUID(), vLPAssignmentHeaderID, vvStudentId, LW.`Note`, vvSubject, LW.`WorkType`,
                                          LW.`DayOfWeek`, case when LW.`WorkType` = 'AW' then 0 else coalesce(LC.`NewWSCount`, LW.`NoOfWS`) end, 
                                          1, LC.`CreatedBy`, current_timestamp, cActive
                                   from `lpworksheetassignment` LW
                                     left join `lprequestworksheetchange` LC ON (LC.`CurrentDOW` = LW.`DayOfWeek`) and 
                                                                                (LC.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
                                   where (LW.`LPAssignmentHeaderID`  = vvLatestLPAssignmentHeaderID) and 
                                         (LW.`StudentID` = vvStudentId)    AND
                                         (LW.`Subject`   = vvSubject)      AND
                                         (LW.`Status`      = cActive); 
                                         
          set  vvLatestLPAssignmentHeaderID =   vLPAssignmentHeaderID; 
          
          INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                      select `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                      from lpworksheetassignment where   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;                
      end;
    ELSE                                                     
            insert into tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                      SELECT  LW.`WorkType`,  LW.`DayOfWeek`, CASE WHEN LW.`WorkType` = 'AW' THEN 0 ELSE COALESCE(LC.`NewWSCount`, LW.`NoOfWS`) END,
                                              LW.`Note`
                                      FROM `lpworksheetassignment` LW
                                        LEFT JOIN `lprequestworksheetchange` LC ON (LC.`CurrentDOW` = LW.`DayOfWeek`) AND 
                                                                                (LC.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
                                      WHERE (LW.`LPAssignmentHeaderID`  = vvLatestLPAssignmentHeaderID) AND 
                                            (LW.`StudentID` = vvStudentId)    AND
                                            (LW.`Subject`   = vvSubject)      AND
                                            (LW.`Status`      = cActive);    
                                         
  end if;
  
  
  SELECT LP.`Level`
  INTO vvLevelStart
  FROM  `worksheetscore` LP
  where LP.`Subject`            = vvSubject and
        cast(LP.`WorksheetDate` as Date) =  vDate    and 
        LP.`StudentID`          = vvStudentId
  LIMIT 1;
  
  
  /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType                     = NULL,
              vvNoOfWSOfTheDay               = NULL,
              vvWorksheetRangeEnd            = NULL,
              vvWorksheetRangeStart          = NULL,
              vvPrevDayWSNo                  = NULL,
              vvIsAssessmentDoneonCW         = 0,
              vvWSEndNo                      = NULL,
              vvStartTime                    = NULL,
              vvEndTime                      = NULL,
              vvExtSpecialActivity           = NULL,
              vvExtRequestText               = NULL,
              vvSysMessage                   = NULL,
              vvExtWorkType                  = NULL,
              vvExtFromTime                  = NULL,
              vvExtToTime                    = NULL,       
              vvExtWSCount                   = NULL;      
        
        
        select `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
               `FromTime`, `ToTime`
        into   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
               vvExtWorkType, vvExtFromTime,  vvExtToTime
        from `lessonplanscoreassignment` 
        where `StudentID`   =  vvStudentId  AND
              `Subject`     =  vvSubject    And
              `Date`        =  vDate        and
              `WorkType`   not in ('AW','NW') and
              `Status`      =  cActive
              limit 1;
              
       select count(*)
       into vvExtWSCount 
       from `worksheetscore`
       where `StudentID`                    =  vvStudentId  AND
             `Subject`                      =  vvSubject    AND
             cast(`WorksheetDate` as date)  =  vDate        AND
             `Status`                       =  cActive
        LIMIT 1;
       
              
              
              
              
         
        select SL.`WSEndNo`, SL.`WSStartNo`  
        into   vvWSEndNo, vvWorksheetRangeStart 
        from `studentsubjectlevel` SL
        where SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart and
              SL.`Status`     = cActive
         limit 1;
              
       SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                   ELSE vvWSEndNo END INTO vvWSEndNo;
        
        SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
        
         SELECT  WorkType,   NoOfWS
         INTO    vvWorkType, vvNoOfWSOfTheDay
         FROM tttemplpworksheetassignment        
         where  WeekDayName = SUBSTRING(DAYNAME(vDate), 1, 3) and
                WorkType in ('HW', 'CW')
         LIMIT 1;
           
          
        
      SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  <  vDate    
         ORDER BY  WS.`WorksheetDate` desc, WS.`WorksheetNum` DESC
         LIMIT 1;
          
      IF(vvWorkType = cCWWorkType) THEN 
            BEGIN
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
             LIMIT 1;
            END;
            END IF;
            
            IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1,           HolidayDesc,   cHWWorkType 
                      INTO   vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM holiday
                      WHERE HolidayDate = vDate
                      limit 1;
             
             END IF;  
             
     if (IfNull(vvNoOfWSOfTheDay, 0) = 0) then
      set vvWorkType = Null;
     end if;      
      
          
  AbsentExitHandler: Begin 
  NullWorkTypeExitHandler: BEGIN     
  
  
     /* Existing requests related records and if any we should not override the existing request related changes */
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtWorkType in ('Absent')) THEN
         
         set vvExtWorkType = 'Absent';
         leave AbsentExitHandler;  
     
      END IF;
    IF (vvWorkType is null) THEN
         
         LEAVE NullWorkTypeExitHandler;  
     
      END IF;
      
      if (vvExtSpecialActivity is not null and vvExtSpecialActivity in ('Concept', 'Correction')) then
         
           select cCWWorkType, 0,                0,             vvExtSpecialActivity              
           into   vvWorkType,  vvNoOfWSOfTheDay, vvPrevDayWSNo, vvSpecialActivity;
      end if;
      
      IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('PickupWork')) THEN
         
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
       END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SD')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity,  vvExtToTime
           INTO   vvWorkType,  vvSpecialActivity,     vvEndTime;  
        END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SH')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, floor(IfNull(vvNoOfWSOfTheDay, 0)*3)
           INTO   vvWorkType,  vvSpecialActivity,    vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
        END IF;
        
        IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_ST')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, FLOOR(IFNULL(vvNoOfWSOfTheDay, 0)*1.5)
           INTO   vvWorkType,  vvSpecialActivity, vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
         END IF;
         
         if (exists(select 1 from `holiday` where `HolidayDesc` = vvExtSysMessage and `Status` = cActive)) then
           
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
         end if;
         
 end NullWorkTypeExitHandler;
         
         /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR 
                           vvPrevDayWSNo = 0    OR 
                           vvPrevDayWSNo = vvWSEndNo THEN coalesce(vvWorksheetRangeStart, 1)
                      ELSE vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > IFNULL(vvWSEndNo, 0) THEN vvWSEndNo
                       ELSE ((vvWorksheetRangeStart +  vvNoOfWSOfTheDay -1)) END INTO vvWorksheetRangeEnd;
        
         if (vvExtWorkType <> 'Absent') then
         
          
         /*  Update lesson planning days as InActive and initilize 
              the lesson planning again from the requested date */
              UPDATE `lessonplanscoreassignment` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` =  vvStudentID) AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (LP.`WorkType`  not in ('AW'))  and
                    (CAST(LP.`Date` AS DATE) =    vDate); 
                    
                    
             UPDATE `worksheetscore` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` =  vvStudentID) AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (CAST(LP.`WorksheetDate` AS DATE) =    vDate);
                    
           SET vvLessonPlanScoreAssignmentID = UUID();     
          
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
           
           
          IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;             
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              
              
              call sp_AssessmentOrReviewPacketPlanning (vDate, vLPAssignmentHeaderID, vUserId, vvStudentId, vvSubject, vvLevelStart, @vOutLevel, @vOutDate);
              
              set vDate        =  @vOutDate,
                  vvLevelStart =  @vOutLevel; 
                    
          END;
            END IF;
          end if;  
          
    END AbsentExitHandler; 
    
           IF (vvReqEndDate IS NOT NULL AND vvReqEndDate = vDate) THEN
             begin
             DELETE FROM tttemplpworksheetassignment;
               
             INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                   
                                      SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                      FROM lpworksheetassignment WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID; 
                                      
            end;
          END IF;
           
           SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
                        
           
           SET vvStartWSNumForAbsent = NULL;                            
           
        
      END WHILE;
      
  
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SameDayTimeChangeRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_SameDayTimeChangeRequest`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
 
 /* Declare the variables here */
 DECLARE vvStudentId       CHAR(38);
 DECLARE vvSubject         VARCHAR(50);
 DECLARE vvCurrentDate     DATE;
 DECLARE vvNewDate         DATE;
 DECLARE vvCurrentSlotId   CHAR(38);
 DECLARE vvNewSlotId       CHAR(38); 
 DECLARE vvLPRequestAbsentID 
                           CHAR(38); 
 DECLARE vvLatestLPAssignmentHeaderID
                           CHAR(38); 
 DECLARE vvStartTime       TIME;
 DECLARE vvEndTime         TIME;
 DECLARE vvDateDay         TIME;
 declare vvEndDate         date;
 DECLARE vvNoOfRequests    INT;
 DECLARE cActive           VARCHAR(50);
 DECLARE cInActive         VARCHAR(50);
 DECLARE cProcessed        VARCHAR(50);
 DECLARE vRecordId         INT;
 DECLARE cHWWorkType       VARCHAR(10);
 DECLARE cCWWorkType       VARCHAR(10);
 DECLARE vvCurrentDOW      VARCHAR(10);
 DECLARE vvNeWDOW          VARCHAR(10);
 DECLARE vvIsPermanent     BIT;
 DECLARE vvReqEndDate      DATE;
 DECLARE vvExtToTime                TIME;
 DECLARE vvWSCount                  INT;
 DECLARE vvExtSpecialActivity       VARCHAR(100);
 DECLARE vvExtRequestText           VARCHAR(100);
 DECLARE vvExtSysMessage            VARCHAR(100);
 DECLARE vvExtWorkType              VARCHAR(100);       
 DECLARE vvExtFromTime              TIME;
 DECLARE vvExtWSCount               INT;
 DECLARE vvSysMessage               VARCHAR(100);
 

 /* Initialize the variables here */ 
 SET cActive       = 'Active', 
     cInActive     = 'InActive',
     cProcessed    = 'Processed',
     vRecordId     = 0,
     cHWWorkType   = 'HW',
     cCWWorkType   = 'CW'; 
    
                                                      
                                                    
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`,LH.`Subject`, LH.`RequestStartDate`,
         LH.`IsPermanent`, LH.`RequestEndDate` 
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  LIMIT 1;
  
 
  DROP TEMPORARY  TABLE  IF EXISTS tttimechangedetails;
  
  CREATE TEMPORARY TABLE tttimechangedetails (CurrentDOW       VARCHAR(50),
                                              CurrentSlotId    CHAR(38),
                                              NewDOW           VARCHAR(50),
                                              NewSlotId        CHAR(38));
                                              
  
  INSERT INTO tttimechangedetails (CurrentDOW, CurrentSlotId, NewDOW, NewSlotId)
                            SELECT `CurrentDOW`, `CurrentSlotId`, `NewDOW`, `NewSlotId`
                            FROM `lprequesttimechange`
                            WHERE `LPAssignmentHeaderID`= vLPAssignmentHeaderID;
                            
                            

  WHILE(vvReqEndDate >= vDate) 
    DO
      /*Reset the values here */
      SET vvCurrentDate                  = NULL,
          vvNewDate                      = NULL, 
          vvCurrentSlotId                = NULL, 
          vvNewSlotId                    = NULL, 
          vvStartTime                    = NULL, 
          vvLPRequestAbsentID            = NULL,
          vvEndTime                      = NULL,
          vvCurrentDOW                   = NULL,
          vvExtSpecialActivity           = NULL,
          vvExtRequestText               = NULL,
          vvSysMessage                   = NULL,
          vvExtWorkType                  = NULL,
          vvExtFromTime                  = NULL,
          vvExtToTime                    = NULL,       
          vvExtWSCount                   = NULL,
          vvNewDOW                       = NULL; 
            
  
  
  SELECT `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
         `FromTime`, `ToTime`
  INTO   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
         vvExtWorkType, vvExtFromTime,  vvExtToTime
  FROM `lessonplanscoreassignment` 
  WHERE `StudentID`   =  vvStudentId  AND
        `Subject`     =  vvSubject    AND
        `Date`        =  vDate        AND
        `WorkType`   NOT IN ('AW','NW') AND
        `Status`      =  cActive
  LIMIT 1;
  
  SELECT COUNT(*)
   INTO vvExtWSCount
   FROM `worksheetscore` 
   WHERE `StudentID`   =  vvStudentId    AND
           `Subject`     =  vvSubject      AND
           `WorksheetDate`        =  vDate          AND
           `Status`      =  cActive
     LIMIT 1;
  

  
  ValidationExitHandler: BEGIN

     /* Existing requests related records and if any we should not override the existing request related changes */
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtWorkType IN ('Absent')) THEN
         
         SET vvExtWorkType = 'Absent';
         LEAVE ValidationExitHandler;  
     
      END IF;
   
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('Concept', 'Correction', 'PickupWork',
                                                                       'MakeupRequest_SD', 'MakeupRequest_SH', 
                                                                       'MakeupRequest_ST')) THEN
         
         LEAVE ValidationExitHandler; 
           
      END IF;
      
     IF (EXISTS(SELECT 1 FROM `holiday` WHERE `HolidayDesc` = vvExtSysMessage AND `Status` = cActive)) THEN
           
           LEAVE ValidationExitHandler; 
           
      END IF;
      
      IF (EXISTS(SELECT 1 FROM tttimechangedetails WHERE CurrentDOW = SUBSTRING(DAYNAME(vDate), 1, 3) OR 
                                                         NewDOW     = CurrentDOW)) THEN
                                                         
        BEGIN
       
       
       
          SELECT CurrentDOW, NewDOW, CurrentSlotId, NewSlotId
          INTO vvCurrentDOW, vvNewDOW, vvCurrentSlotId, vvNewSlotId
          FROM tttimechangedetails
          WHERE CurrentDOW = SUBSTRING(DAYNAME(vDate), 1, 3);
      
      IF (vvCurrentDOW = vvNewDOW) THEN
        BEGIN
        
        
      
        SELECT `StartTime`, `EndTime`
        INTO vvStartTime, vvEndTime
        FROM `slot` 
        WHERE `SlotID` = vvNewSlotId;
        
        
     
        /* Update the existing request as InActive */
        UPDATE `studentcenterslot`
        SET `Status`    = cInActive,
            `UpdatedBy` = vUserId,
            `UpdatedOn` = CURRENT_TIMESTAMP
        WHERE `StudentID`          =  vvStudentId     AND
              `Subject`            =  vvSubject       AND
              CAST(`Date` AS DATE) =  vDate   AND
              `SlotID`             =  vvCurrentSlotId AND
              `Status`             =  cActive;
             
        /* Insert new request */
        INSERT INTO `studentcenterslot` (`StudentCenterSlotID`, `StudentID`, `Subject`, `Date`, `SlotID`,
                                         `CreatedBy`, `CreatedOn`, `Status`, `StartDate`)
                                  SELECT UUID(), vvStudentId, vvSubject, vDate, vvNewSlotId, vUserId,
                                         CURRENT_TIMESTAMP, cActive, CURRENT_TIMESTAMP;
        
             
                              
        /* update slot timings on lesson plan */
        UPDATE `lessonplanscoreassignment`
        SET `FromTime`  = vvStartTime,
            `ToTime`    = vvEndTime,
            `UpdatedBy` = vUserId,
            `UpdatedOn` = CURRENT_TIMESTAMP    
        WHERE `StudentID`          =  vvStudentId     AND
              `Subject`            =  vvSubject       AND
              CAST(`Date` AS DATE) =  vDate           AND
              `Status`             =  cActive;      
         END;    
      END IF;  /* same date block end */
      
       END;    
      END IF;      
      
     END ValidationExitHandler;
  
  
       SELECT DATE_ADD((vDate),INTERVAL 1 DAY)
       INTO vDate;
    
  END WHILE; 
  
  
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_SpreadTimeOverTwoClasses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_SpreadTimeOverTwoClasses`(	
	IN vStudentId CHAR(38),
	IN vDate DATE,
        IN vSubject VARCHAR(40)
)
BEGIN
	SELECT 
	DATE,SUBSTRING(DAYNAME(DATE),1,3) as Day,FromTime, ADDTIME(ToTime,'00:15:00')  as ToTime 
	FROM `lessonplanscoreassignment`
	WHERE StudentId = vStudentId
	AND SUBJECT=vSubject AND Status='Active'  AND WorkType='CW' AND DATE > vDate ORDER BY DATE LIMIT 2; 
	
	
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_StayOneHourNextClasse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_StayOneHourNextClasse`(	
	IN vStudentId CHAR(38),
	IN vDate DATE,
        IN vSubject VARCHAR(40)
)
BEGIN
	SELECT 
	DATE,SUBSTRING(DAYNAME(DATE),1,3) AS DAY,FromTime,ADDTIME(ToTime,'00:30:00')  AS ToTime  
	FROM `lessonplanscoreassignment`
	WHERE StudentId = vStudentId
	AND SUBJECT=vSubject AND STATUS='Active'  AND WorkType='CW' AND DATE > vDate ORDER BY DATE LIMIT 1; 
	
	
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_StudentSlotAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_StudentSlotAssignment`(
    
IN vAction                 VARCHAR(50),
  IN vStudentAssignmentID   CHAR(38),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE    
    
    )
BEGIN

DECLARE cACTIVE VARCHAR(50);

DECLARE cINACTIVE VARCHAR(50);


 DECLARE vvDummy              int;
 DECLARE vvRunDate              DATE;
  DECLARE vvStudentId              char(38);
   DECLARE vvSlotId       char(38);
    DECLARE vvDayOfWeek              DATE;
    DECLARE vvIsPermament              bit;
    DECLARE vvSubject              varchar(50);
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATEtime;
    DECLARE vvCurrDate              DATE;
    
    
    

    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
 SET vvRunDate = vStartDate;
 
 
	 iF (vEndDate is null) then
	 begin
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   

		
	 
	END;	
	end if;
	
	SELECT vvRunDate, vStartDate, vEndDate;


	 select 
		CASE WHEN DAYOFWEEK = 'Sun' THEN 1
	 WHEN DAYOFWEEK = 'Mon' THEN 2
	 WHEN DAYOFWEEK = 'Tue' THEN 3
	 WHEN DAYOFWEEK = 'Wed' THEN 4
	 WHEN DAYOFWEEK = 'Thu' THEN 5
	 WHEN DAYOFWEEK = 'Fri' THEN 6
	 WHEN DAYOFWEEK = 'Sat' THEN 7 END,
	 DayOfWeek,slotID,studentID,IsPermanent,Subject
	 into vvDayNumDB, vvDayOfWeek,vvSlotId,vvStudentId,vvIsPermament,vvSubject
	 from studentassignmenttemplate where StudentAssignmentID = vStudentAssignmentID; 
 	
 	
 	/*
	SELECT DAYOFWEEK(vvRunDate) INTO vvDayNum;
	
	SELECT DATE_ADD((vvRunDate),INTERVAL 1 DAY) INTO vvRunDate; 
	
	*/
	
	
	-- select vvDayNumDB;
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	select 'before', vvRunDate, vvDayNumDB;
	-- select vvRunDate;
	
        if vvRunDate < vStartDate then
        begin
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		select 'in if 1', vvRunDate;
		-- SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
		SELECT 'in if 2', vvRunDate;
	end;
	end if;
        SELECT 'out of if', vvRunDate; 
	WHILE (vEndDate >= vvRunDate) 
        DO 
        
			-- SELECT vvRunDate;
		If (vAction = 'ADD') then
		begin
        
        
        
        -- todo: Check if for the same student, same day, same subject and same slot with status = "active" then don't do anything
        
			INSERT INTO `lcmdev`.`studentcenterslot` (
			  `StudentCenterSlotID`,
			  `StudentID`,
			  `Subject`,
			  `Date`,
			  `SlotID`,
			  `CreatedBy`,
			  `CreatedOn`,
			  `Status`,
			  `StartDate`
			)
			VALUES
			  (
			    UUID(),
			    vvStudentID,
			    vvSubject,
			    vvRunDate,
			    vvSlotID,
			    vUserId,
			    vvCurrTimeStamp,
			    cActive , 
			    vvCurrDate
			  );
			  
		end;
		
		ELSEIF(vAction = 'REMOVE') THEN	
		begin	
			UPDATE
			  studentcenterslot
			SET
			  `Status` = cINACTIVE,
			  `UpdatedBy` = vUserId,
			  `UpdatedOn` = vvCurrTimeStamp,
			  `EndDate` = vvCurrDate
			WHERE StudentID = vvStudentiD and Subject = vvSubject 
			and SlotID = vvSlotID and Date = vvRunDate;

		end;
		end if;
        
       SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      


        END WHILE;
        
        



 




	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_StudentSlotAssignmentNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_StudentSlotAssignmentNew`(
    
IN vAction                 VARCHAR(50),
  IN vStudentAssignmentID   CHAR(38),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE    
    
    )
BEGIN

DECLARE cACTIVE VARCHAR(50);

DECLARE cINACTIVE VARCHAR(50);


 DECLARE vvDummy              INT;
 DECLARE vvRunDate              DATE;
  DECLARE vvStudentId              CHAR(38);
   DECLARE vvSlotId       CHAR(38);
    DECLARE vvDayOfWeek              DATE;
    DECLARE vvIsPermament              BIT;
    DECLARE vvSubject              VARCHAR(50);
    DECLARE vvDayNum              INT;
    DECLARE vvDayNumDB              INT;
    DECLARE vvCurrTimeStamp              DATETIME;
    DECLARE vvCurrDate              DATE;
    
    
    

    
 
 
 -- DECLARE vvEndDate              DATE;
	SET cACTIVE = 'Active';	
	SET cINACTIVE = 'Inactive';
	SET vvCurrTimeStamp = CURRENT_TIMESTAMP();
	SET vvCurrDate = CURDATE();
 
 SET vvRunDate = vStartDate;
 
 
	 IF (vEndDate IS NULL) THEN
	 BEGIN
		SELECT CONCAT(YEAR(vStartDate), '-12-31') INTO vEndDate;   

		
	 
	END;	
	END IF;
	
	SELECT vvRunDate, vStartDate, vEndDate;


	 SELECT 
		CASE WHEN DAYOFWEEK = 'Sun' THEN 1
	 WHEN DAYOFWEEK = 'Mon' THEN 2
	 WHEN DAYOFWEEK = 'Tue' THEN 3
	 WHEN DAYOFWEEK = 'Wed' THEN 4
	 WHEN DAYOFWEEK = 'Thu' THEN 5
	 WHEN DAYOFWEEK = 'Fri' THEN 6
	 WHEN DAYOFWEEK = 'Sat' THEN 7 END,
	 DAYOFWEEK,slotID,studentID,IsPermanent,SUBJECT
	 INTO vvDayNumDB, vvDayOfWeek,vvSlotId,vvStudentId,vvIsPermament,vvSubject
	 FROM studentassignmenttemplate WHERE StudentAssignmentID = vStudentAssignmentID; 
 	
 	
 	/*
	SELECT DAYOFWEEK(vvRunDate) INTO vvDayNum;
	
	SELECT DATE_ADD((vvRunDate),INTERVAL 1 DAY) INTO vvRunDate; 
	
	*/
	
	
	-- select vvDayNumDB;
	
	SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
	SELECT 'before', vvRunDate, vvDayNumDB;
	-- select vvRunDate;
	
        IF vvRunDate < vStartDate THEN
        BEGIN
		SELECT DATE_ADD(vvRunDate, INTERVAL 7 DAY) INTO vvRunDate;
		SELECT 'in if 1', vvRunDate;
		-- SELECT DATE_ADD(vvRunDate, INTERVAL (vvDayNumDB - DAYOFWEEK(vvRunDate)) DAY) INTO vvRunDate;
		SELECT 'in if 2', vvRunDate;
	END;
	END IF;
        SELECT 'out of if', vvRunDate; 
	WHILE (vEndDate >= vvRunDate) 
        DO 
        
			-- SELECT vvRunDate;
		IF (vAction = 'ADD') THEN
		BEGIN
        
        
        
        -- todo: Check if for the same student, same day, same subject and same slot with status = "active" then don't do anything
        
			INSERT INTO `lcmdev`.`studentcenterslot` (
			  `StudentCenterSlotID`,
			  `StudentID`,
			  `Subject`,
			  `Date`,
			  `SlotID`,
			  `CreatedBy`,
			  `CreatedOn`,
			  `Status`,
			  `StartDate`
			)
			VALUES
			  (
			    UUID(),
			    vvStudentID,
			    vvSubject,
			    vvRunDate,
			    vvSlotID,
			    vUserId,
			    vvCurrTimeStamp,
			    cActive , 
			    vvCurrDate
			  );
			  
		END;
		
		ELSEIF(vAction = 'REMOVE') THEN	
		BEGIN	
			UPDATE
			  studentcenterslot
			SET
			  `Status` = cINACTIVE,
			  `UpdatedBy` = vUserId,
			  `UpdatedOn` = vvCurrTimeStamp,
			  `EndDate` = vvCurrDate
			WHERE StudentID = vvStudentiD AND SUBJECT = vvSubject 
			AND SlotID = vvSlotID AND DATE = vvRunDate;

		END;
		END IF;
        
       SELECT DATE_ADD((vvRunDate),INTERVAL 7 DAY) INTO vvRunDate; 
      


        END WHILE;
        
        



 




	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TimeChangeLessonRePlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_TimeChangeLessonRePlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
 
 /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  declare vvNewSlotId                CHAR(38);
  DECLARE vvLatestLPAssignmentHeaderID
                                     CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvNewWSCount               INT;
  DECLARE vvSpecialActivity          VARCHAR(100);
  DECLARE vvRequestText              VARCHAR(100);
  DECLARE vvSysMessage               VARCHAR(100);       
  DECLARE vvFromTime                 TIME;
  DECLARE vvExtToTime                TIME;
  DECLARE vvWSCount                  INT;
  DECLARE vvExtSpecialActivity       VARCHAR(100);
  DECLARE vvExtRequestText           VARCHAR(100);
  DECLARE vvExtSysMessage            VARCHAR(100);
  DECLARE vvExtWorkType              VARCHAR(100);       
  DECLARE vvExtFromTime              TIME;
  declare vvNewDay                   varchar(50);
  
  
  DECLARE vvExtWSCount               INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvIsPermanent              BIT;
  declare cProcessed                 VARCHAR(50);
  declare vRecordId                  int;
  DECLARE vvLessonPlanScoreAssignmentID   
                                     CHAR(38);
  DECLARE vvStartWSNumForAbsent      INT; 
  declare vvTimeChangeReqEndDate     date;
  
  DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);                                  
 
 
 
  

 /* Initialize the variables here */ 
 set cActive       = 'Active', 
     cInActive     = 'InActive',
     cProcessed    = 'Processed',
     vRecordId     = 0,
     cHWWorkType   = 'HW',
     cCWWorkType   = 'CW'; 
    
                                                      
                                                   
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`, LH.`Subject`, LH.`RequestStartDate`,
         LH.`IsPermanent`, coalesce(LH.`RequestEndDate`,CONCAT(YEAR(LH.`RequestStartDate`), '-12-31')),
         LH.`RequestStartDate`
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate, vvReqStartDate
  FROM `lpassignmentheader` LH 
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  LIMIT 1;  
  
  
  SELECT `WorksheetNum`
  INTO vvStartWSNumForAbsent
  FROM `worksheetscore`
  WHERE `StudentID`       = vvStudentID AND 
        `Subject`         = vvSubject   AND
        `WorksheetDate`   = vvReqStartDate AND 
        `Status`          = cActive
  ORDER BY `WorksheetNum` LIMIT 1;
  
  if (vvReqEndDate = vvReqStartDate) then
     
      if (exists(select 1 from `lprequesttimechange` where `LPAssignmentHeaderID` = vLPAssignmentHeaderID and 
                                                           `CurrentDOW` <> `NewDOW`)) then
         
         select `NewDOW`
         into vvNewDay
         from `lprequesttimechange` 
         WHERE `LPAssignmentHeaderID` = vLPAssignmentHeaderID;        
         
                                                           
        select `Date`
        into vvTimeChangeReqEndDate
        from `lessonplanscoreassignment` 
        where substring(dayname(`Date`), 1, 3) = vvNewDay and 
              `Date` > vvReqStartDate
        order by Date limit 1;
        
                                                           
      end if;
       
  
  end if;
  
  
  SELECT `LPAssignmentHeaderID`
  INTO   vvLatestLPAssignmentHeaderID
  FROM `lpworksheetassignment` lwa1 
  WHERE StudentID   = vvStudentID   AND 
        SUBJECT     = vvSubject     AND 
        IsPermanent = b'1'          AND
        STATUS = cActive            AND 
        NOT EXISTS (SELECT 1 FROM lpworksheetassignment lwa2 WHERE lwa2.studentid = lwa1.studentid AND 
                                                                   lwa2.subject = lwa1.subject AND 
                                                                   lwa2.IsPermanent = b'1' AND 
                                                                   lwa2.status = 'Active'  AND 
                                                                   lwa2.createdon > lwa1.createdon)
                                                                   LIMIT 1;
                                                             
  
  DROP TABLE IF EXISTS tttimechangeworkloadexchangesheetassignment;  
  
  CREATE TEMPORARY TABLE tttimechangeworkloadexchangesheetassignment (WorkType      VARCHAR(20),
                                                                      NoOfWS        INT,
                                                                      DayOfTheWeek  VARCHAR(20));
                                                                      
  /* Interchange the work load from one day to another */
  CALL sp_TimeChangeWorkLoadExchangeSheetAssignment(vvLatestLPAssignmentHeaderID, vLPAssignmentHeaderID);
  
  
  
  DROP TEMPORARY  TABLE  IF EXISTS tttemplpworksheetassignment;
   
   CREATE TEMPORARY TABLE tttemplpworksheetassignment (WorkType      VARCHAR(50), 
                                                       WeekDayName   VARCHAR(50),   
                                                       NoOfWS        INT,
                                                       Note          TEXT);
  
  
   
   IF (vvIsPermanent = 1) THEN
    BEGIN
    /* Insert the work sheet assignment if the request is permanent */
    if (not exists (select 1 from `lpworksheetassignment` where `LPAssignmentHeaderID` = vLPAssignmentHeaderID)) then 
    
     INSERT INTO `lpworksheetassignment` (`LPWorkSheetAssignmentID`, `LPAssignmentHeaderID`, `StudentID`, `Note`,
                                         `Subject`, `WorkType`, `DayOfWeek`, `NoOfWS`, `IsPermanent`, `CreatedBy`,
                                         `CreatedOn`, `Status`)
                                   SELECT UUID(), vLPAssignmentHeaderID, vvStudentId, NULL, vvSubject, 
                                          WorkType, DayOfTheWeek, NoOfWS, 1, vUserId, CURRENT_TIMESTAMP, cActive
                                   FROM tttimechangeworkloadexchangesheetassignment;
    end if;
                                         
          SET  vvLatestLPAssignmentHeaderID =  vLPAssignmentHeaderID; 
          
          
      INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                      SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                      FROM lpworksheetassignment 
                                      WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;                
      END;
    ELSE                                                     
            INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                              SELECT WorkType, DayOfTheWeek, NoOfWS, Null  
                                              FROM tttimechangeworkloadexchangesheetassignment;
                                         
  END IF;
  
  
 
  
  SELECT LP.`Level`
  INTO vvLevelStart
  FROM  `worksheetscore` LP
  WHERE LP.`Subject`            = vvSubject   AND
        CAST(LP.`WorksheetDate` AS DATE) = vDate       AND 
        LP.`StudentID`          = vvStudentId

  LIMIT 1;
  
  
  SET vvEndDate        = CONCAT(YEAR(vDate), '-12-31');
  SET vvSubjectLevel   = CONCAT(vvSubject, 'Level');
  
  
    
  if (not exists(select 1 from `lprequesttimechange` where `LPAssignmentHeaderID` = vLPAssignmentHeaderID  and 
                                                           `CurrentDOW`          <> `NewDOW`)) then
      
     call sp_SameDayTimeChangeRequest (null, vLPAssignmentHeaderID, null, null, vUserId, Null, Null)     ;
  
  
  else 
    begin 
     
     
   while(vvEndDate >= vDate) 
    do
      /*Reset the values here */
      SET vvWorkType                     = null,
          vvNewSlotId                    = NULL, 
          vvStartTime                    = NULL, 
          vvEndTime                      = NULL,
          vvExtSpecialActivity           = NULL,
          vvExtRequestText               = NULL,
          vvSysMessage                   = NULL,
          vvExtWorkType                  = NULL,
          vvExtFromTime                  = NULL,
          vvExtToTime                    = NULL,
          vvWorksheetRangeStart          = null,
          vvPrevDayWSNo                  = null,
          vvExtWSCount                   = NULL;
          
          
         
          
     SELECT `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
            `FromTime`, `ToTime`
     INTO   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
            vvExtWorkType, vvExtFromTime,  vvExtToTime
     FROM `lessonplanscoreassignment` 
     WHERE `StudentID`   =  vvStudentId    AND
           `Subject`     =  vvSubject      AND
           `Date`        =  vDate          AND
           `WorkType`   NOT IN ('AW','NW') AND
           `Status`      =  cActive
     LIMIT 1;
     
   
   
   select count(*)
   into vvExtWSCount
   from `worksheetscore` 
   WHERE `StudentID`   =  vvStudentId    AND
           `Subject`     =  vvSubject      AND
           `WorksheetDate`        =  vDate          AND
           `Status`      =  cActive
     LIMIT 1;
       
     
     SELECT SL.`WSEndNo`, SL.`WSStartNo`  
       INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
         
        SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                   ELSE vvWSEndNo END INTO vvWSEndNo;
                   
        SELECT CASE WHEN vvStartWSNumForAbsent IS NOT NULL THEN vvStartWSNumForAbsent
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
        
       /* SELECT CASE WHEN vvWorksheetRangeStart IS NULL  THEN 1
                   ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; */
        
         
       
        
         SELECT  WorkType,   NoOfWS
         INTO    vvWorkType, vvNoOfWSOfTheDay
         FROM tttemplpworksheetassignment        
         WHERE  WeekDayName = SUBSTRING(DAYNAME(vDate), 1, 3) AND
                WorkType IN ('HW', 'CW')
         LIMIT 1;
           
          
        
      SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  <  vDate    
         ORDER BY  WS.`WorksheetDate` DESC, WS.`WorksheetNum` DESC
         LIMIT 1;
          
            
            IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1,           HolidayDesc,   cHWWorkType 
                      INTO   vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM Holiday
                      WHERE HolidayDate = vDate
                      LIMIT 1;
             
             END IF;  
             
     IF (IFNULL(vvNoOfWSOfTheDay, 0) = 0) THEN
      SET vvWorkType = NULL;
     END IF;  
  
ValidationExitHandler: Begin
NullWorkTypeExitHandler: BEGIN     

   /* Existing requests related records and if any we should not override the existing request related changes */
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtWorkType IN ('Absent')) THEN
         
         SET vvExtWorkType = 'Absent';
         LEAVE ValidationExitHandler;  
     
      END IF;
      
      IF (vvWorkType IS NULL) THEN
         
         LEAVE NullWorkTypeExitHandler;  
     
      END IF;
   
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('Concept', 'Correction', 'PickupWork',
                                                                       'MakeupRequest_SD', 'MakeupRequest_SH', 
                                                                       'MakeupRequest_ST')) THEN
         
         LEAVE ValidationExitHandler; 
           
      END IF;
      
     IF (EXISTS(SELECT 1 FROM `holiday` WHERE `HolidayDesc` = vvExtSysMessage AND `Status` = cActive)) THEN
           
           LEAVE ValidationExitHandler; 
           
      END IF;
    
    
         
  END NullWorkTypeExitHandler;    
  

  
     IF (not exists(select 1 from `studentcenterslot` where `StudentID` = vvStudentId and 
                                                            `Subject`   = vvSubject and 
                                                            `Date`      = vDate)
        AND (vvWorkType = cCWWorkType)) THEN
       begin     
       
       
       
       
           select `NewSlotId`
           into vvNewSlotId 
           from `lprequesttimechange`
           where `LPAssignmentHeaderID` = vLPAssignmentHeaderID           and
                 `NewDOW`               = substring(dayname(vDate), 1, 3);
                 
          
       
           insert into `studentcenterslot` (`StudentCenterSlotID`, `StudentID`, `Subject`, `Date`,
                                           `SlotID`, `CreatedBy`, `CreatedOn`, `Status`)
                                     select UUID(), vvStudentId, vvSubject, vDate, vvNewSlotId, 
                                            vUserId, current_timestamp, cActive; 
        end;           
      END IF; 
      
      if (vvWorkType = cHWWorkType) and 
         (exists(select 1 from `studentcenterslot` where `Date`       =  vDate       and 
                                                         `StudentID`  =  vvStudentId and
                                                         `Subject`    =  vvSubject   and
                                                         `Status`     =  cActive)) then
          begin
              
              update `studentcenterslot`
              set `Status`    = cInActive,
                  `UpdatedBy` = vUserId,
                  `UpdatedOn` = current_timestamp  
              WHERE `Date`       =  vDate       AND 
                    `StudentID`  =  vvStudentId AND
                    `Subject`    =  vvSubject   AND
                    `Status`     =  cActive; 
          
          end;
       end if;
       
      IF(vvWorkType = cCWWorkType) THEN 
            
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
             LIMIT 1;
            
            END IF;
      
      
      
      
     /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR 
                           vvPrevDayWSNo = 0    OR 
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > IFNULL(vvWSEndNo, 0) THEN vvWSEndNo
                       ELSE ((vvWorksheetRangeStart +  vvNoOfWSOfTheDay -1)) END INTO vvWorksheetRangeEnd;
         
         
         
         IF (coalesce(vvExtWorkType, '') <> 'Absent') THEN
         
          
          
         /*  Update lesson planning days as InActive and initilize 
              the lesson planning again from the requested date */
              UPDATE `lessonplanscoreassignment` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vvStudentID)  AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (LP.`WorkType`  NOT IN ('AW'))  AND
                    (CAST(LP.`Date` AS DATE) =    vDate);
                    
                    
            UPDATE `worksheetscore` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vvStudentID)  AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (CAST(LP.`WorksheetDate` AS DATE) =    vDate);
                    
                     
                 SET vvLessonPlanScoreAssignmentID = UUID();               
          
          
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                      
           IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;                        
                                                     
          
     IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              
              
              CALL sp_AssessmentOrReviewPacketPlanning (vDate, vLPAssignmentHeaderID, vUserId, vvStudentId, vvSubject, vvLevelStart, @vOutLevel, @vOutDate);
              
              SET vDate        =  @vOutDate,
                  vvLevelStart =  @vOutLevel; 
                    
          END;
            END IF;
          END IF;  
     
     
     
  end ValidationExitHandler;
     
     if (vvReqEndDate IS NOT NULL AND vvReqEndDate = vvReqStartDate and vvTimeChangeReqEndDate = vDate) then
     BEGIN
        DELETE FROM tttemplpworksheetassignment;
               
        INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                         SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                         FROM lpworksheetassignment 
                                         WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;
                                      
        END;                               
                                      
            
       END IF;
  
     IF (vvReqEndDate IS NOT NULL AND vvReqEndDate <> vvReqStartDate and vvReqEndDate = vDate) THEN
       begin
        DELETE FROM tttemplpworksheetassignment;
               
        INSERT INTO tttemplpworksheetassignment (WorkType, WeekDayName, NoOfWS, Note)
                                         SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                         FROM lpworksheetassignment 
                                         WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;
                                      
        end;                               
                                      
            
          END IF;
           
  
  
        SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
               ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
    
    
         SET vvStartWSNumForAbsent = NULL; 
    end while;
     end;
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TimeChangeWorkLoadExchangeSheetAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_TimeChangeWorkLoadExchangeSheetAssignment`(
  In vvLatestLPAssignmentHeaderID char(38),
  IN vLatestLPAssignmentHeaderID  CHAR(38)
  
)
BEGIN

   DROP TEMPORARY  TABLE  IF EXISTS ttlpworksheetassignment;
   
   CREATE TEMPORARY TABLE ttlpworksheetassignment (WorkType       VARCHAR(50),
                                                   DayOfTheWeek   VARCHAR(50),   
                                                   NoOfWS         INT,
                                                   Note           TEXT);
                                                   

 INSERT INTO ttlpworksheetassignment (WorkType, DayOfTheWeek, NoOfWS, Note)
                                 SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                 FROM `lpworksheetassignment`
                                 WHERE `LPAssignmentHeaderID` = vvLatestLPAssignmentHeaderID;
                                 
  DROP TEMPORARY  TABLE  IF EXISTS ttlprequesttimechange;
   
   CREATE TEMPORARY TABLE ttlprequesttimechange (CurrentDOW    VARCHAR(50), 
                                                 CNoOfWS       INT,
                                                 NewDOW        VARCHAR(50), 
                                                 NewNoOfWS     INT);
                                                 
  DROP TEMPORARY  TABLE  IF EXISTS ttlprequesttimechange1;
   
   CREATE TEMPORARY TABLE ttlprequesttimechange1 (CurrentDOW    VARCHAR(50), 
                                                 CNoOfWS       INT,
                                                 NewDOW        VARCHAR(50), 
                                                 NewNoOfWS     INT);

 
   INSERT INTO ttlprequesttimechange (CurrentDOW, CNoOfWS, NewDOW, NewNoOfWS)
                              SELECT  `CurrentDOW`,0, `NewDOW`, 0                         
                              FROM `lprequesttimechange` LT  
                              WHERE `LPAssignmentHeaderID` = vLatestLPAssignmentHeaderID;
                              
  UPDATE ttlprequesttimechange TR
     LEFT JOIN ttlpworksheetassignment LW ON TR.NewDOW = LW.DayOfTheWeek AND 
                                             LW.WorkType IN ('HW', 'CW')
   SET CNoOfWS = IFNULL(LW.NoOfWS, 0);
   
   UPDATE ttlprequesttimechange TR
     LEFT JOIN ttlpworksheetassignment LW ON TR.CurrentDOW = LW.DayOfTheWeek AND 
                                             LW.WorkType IN ('HW', 'CW')
   SET NewNoOfWS = IFNULL(LW.NoOfWS, 0);
 
 
   insert into ttlprequesttimechange1
    select * from ttlprequesttimechange;
    
    
   insert into ttTimeChangeWorkLoadExchangeSheetAssignment
   SELECT  CASE WHEN LW.DayOfTheWeek = TRC.CurrentDOW AND LW.WorkType <> 'AW' THEN 'HW'
                WHEN LW.DayOfTheWeek = TRN.NewDOW     AND LW.WorkType <> 'AW' THEN 'CW' 
                else LW.WorkType END as WorkType, 
           CASE WHEN LW.WorkType = 'AW' THEN 0
                WHEN LW.DayOfTheWeek = TRC.CurrentDOW THEN TRC.CNoOfWS
                WHEN LW.DayOfTheWeek = TRN.NewDOW     THEN TRN.NewNoOfWS
                ELSE LW.NoOfWS END NoOFWS,
                LW.DayOfTheWeek
   FROM  ttlpworksheetassignment LW 
     LEFT JOIN ttlprequesttimechange  TRC ON LW.DayOfTheWeek = TRC.CurrentDOW
     LEFT JOIN ttlprequesttimechange1 TRN ON LW.DayOfTheWeek = TRN.NewDOW;
  


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
  
  
if (vAction = 'Upgrade') then

  CALL sp_UpgradeOrDownGradeLevel_UpGradeLevelLessonPlanning (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate); 
end if;

IF (vAction = 'Downgrade') THEN
      
    call sp_UpgradeOrDownGradeLevel_DownGradeLevelLessonPlanning (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate);
     
END IF;
  
IF (vAction = 'Repeat') THEN

  CALL sp_UpgradeOrDownGradeLevel_RepeatLessonPlanning (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate); 
  
END IF;

IF (vAction = 'ConceptAdvancement') THEN

  CALL sp_UpgradeOrDownGradeLevel_ConceptAdvancementPlanning (vAction, vLPASSIGnmentHeaDErID, vDate , VNotes, vUserId, vStartDate, vEndDate); 
  
END IF;
           
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel_AddRepeatSheets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel_AddRepeatSheets`(
IN  vLPAssignmentHeaderID   CHAR(36),
out vDate                   date,
IN vUserId                  VARCHAR(40)
)
BEGIN

  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  declare vNotes                     text;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvLessonPlanScoreAssignmentID   
                                     CHAR(38);
  
  
  
  /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT); 
                                           
                                           
                                           
  /* Fetch the header data */
  SELECT LH.`StudentID`, LH.`Subject`, LH.`RequestStartDate`, LH.`RequestStartDate`, 
         SL.`Level`, SL.`WSStartNo`, SL.`WSEndNo`
  INTO   vvStudentID, vvSubject, vDate, vvReqStartDate, vvLevelStart, vvWSStartNo,
         vvWSEndNo 
  FROM `lpassignmentheader`   LH 
    join `studentsubjectlevel` SL on LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID);
  

      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvWSEndNo >= vvWSStartNo) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = NULL,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW          
                                    = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = NULL,
              vvIsHoliday           = NULL, 
              vvHolidayDesc         = NULL,
              vvEndTime             = NULL;
        
        
          
  
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
          WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
         
         
         
         SELECT SL.`WSEndNo`, SL.`WSStartNo`  
        INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
          
           SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                        ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetDate`DESC, WS.`WorksheetNum` DESC
         LIMIT 1;
        
        
          
          SELECT S.`StartTime`, S.`EndTime`
          INTO vvStartTime,     vvEndTime
          FROM `slot` S
            JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
          WHERE SS.`StudentID` = vvStudentId AND 
                SS.Subject     = vvSubject   AND
                CAST(SS.`Date` AS DATE)     = vDate
          LIMIT 1;
                
           
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
              
                      
         SELECT CASE  WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
                      
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
                       
           
                   
           SET vvLessonPlanScoreAssignmentID = UUID();
           
          
                                         
         INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
         IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
          
                                                     
        /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
          
          
          SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;  
                        
          set vvWSStartNo = case when vvWSEndNo = vvWorksheetRangeEnd then vvWSEndNo + 1 
                                 else vvWorksheetRangeEnd end;
            
END WHILE;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel_ConceptAdvancementPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel_ConceptAdvancementPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vvLessonPlanScoreAssignmentID  
                                     char(38);
  
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  /* Fetch the header data */
  SELECT LH.`StudentID`,LH.`Subject`,LH.`RequestStartDate`, SL.`Level`,
         SL.`WSStartNo`,  LH.`RequestStartDate`, LH.`RequestEndDate`, LH.`RequestType`
  INTO vvStudentID, vvSubject,  vDate, vvLevelStart, vvStartingWorkSheetNum, 
       vvReqStartDate, vvReqEndDate, vvRequestType               
  FROM `lpassignmentheader`   LH 
    JOIN  `studentsubjectlevel`   SL   ON (LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`)
   LEFT JOIN  `studentcenterslot`     SS   ON (LH.`StudentID`            = SS.`StudentID`) AND 
                                              (LH.`Subject`              = SS.`Subject`)   AND
                                              (CAST(SS.`Date` AS DATE)   = vDate)                                              
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) 
  ORDER BY FIELD(LH.`IsPermanent`, 0, 1) LIMIT 1;

  
 /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (CAST(LP.`Date` AS DATE) >= CAST(vDate AS DATE));
        
        
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (CAST(`WorksheetDate` AS DATE) >= CAST(vDate AS DATE));    
 
   
      SELECT CONCAT(YEAR(vDate), '-12-31') INTO vvEndDate;                                         
    
      
      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = NULL,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW    = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = NULL,
              vvIsHoliday           = NULL, 
              vvHolidayDesc         = NULL,
              vvEndTime             = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
          WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
          SELECT SL.`WSEndNo`, SL.`WSStartNo`  
        INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
          
           SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum 
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
          
        
          SELECT S.`StartTime`, S.`EndTime`
          INTO vvStartTime,     vvEndTime
          FROM `slot` S
            JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
          WHERE SS.`StudentID` = vvStudentId AND 
                SS.Subject     = vvSubject   AND
                CAST(SS.`Date` AS DATE)     = vDate
          LIMIT 1;
                
          
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
               
                      
          SELECT CASE WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum
                      WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
                      
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
                       
          
           SET vvLessonPlanScoreAssignmentID = UUID();
         
                                         
           INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
           
         
         IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;                    
         
          /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);  
                
         
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                
                  
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
   
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                    JOIN `lpassignmentheader`  LH ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
                  WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                        (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   LIMIT 1;
                     
                     IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
		   
		   /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
                    
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                         INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `Notes`, `CreatedBy`, `CreatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW',0, 0,vNotes, vUserId, 
                                                                  CURRENT_TIMESTAMP, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                         INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `FromTime`, `ToTime`, `Notes`, `CreatedBy`, `CreatedOn`,  `Status`, 
                                                                 `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cAssessment, 
                                                                  0, 0, CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes, vUserId, CURRENT_TIMESTAMP,  cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive
                         limit 1;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        LIMIT 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`,  `AdditionalWorkScore`,
                                                                 `Notes`,  `SysMessage`,`CreatedBy`, `CreatedOn`, `Status`, `StartDate`,
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cReviewPacket, 
                                                                  0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId, CURRENT_TIMESTAMP, cActive, CURDATE(), NULL;
                                                               
                      END; 
                    END IF;                   
                
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;   
        
             SET vvStartingWorkSheetNum = NULL;        
        
      END WHILE;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel_DownGradeLevelLessonPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel_DownGradeLevelLessonPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vvLessonPlanScoreAssignmentID
                                     char(38);
 
DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT); 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  
  /* Fetch the header data */
  SELECT LH.`StudentID`,LH.`Subject`,LW.`WorkType`,LH.`RequestStartDate`, SL.`Level`,
         SL.`WSStartNo`, LW.`NoOfWS`, LH.`RequestStartDate`, 
         LH.`RequestEndDate`, LH.`RequestType`
  INTO vvStudentID, vvSubject, vvWorkType, vDate, vvLevelStart, vvStartingWorkSheetNum, 
       vvNoOfWS, vvReqStartDate, vvReqEndDate, vvRequestType                
  FROM `lpassignmentheader`   LH 
   LEFT  JOIN  `lpworksheetassignment` LW  ON (LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`) AND
                                              (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))    AND
                                              (`WorkType` IN ('CW', 'HW' ))
   LEFT JOIN  `studentsubjectlevel`   SL   ON (LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`)
   LEFT JOIN  `studentcenterslot`     SS   ON (LH.`StudentID`            = SS.`StudentID`) AND 
                                              (LH.`Subject`              = SS.`Subject`)   AND
                                              (CAST(SS.`Date` AS DATE)    >= vDate)
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) 
  ORDER BY FIELD(LH.`IsPermanent`, 0, 1) LIMIT 1;
  
  set vvSubjectLevel = CONCAT(vvSubject, 'Level');
  
  update `lessonplanscoreassignment` LS
    set LS.`Status`     = cInActive,
        LS.`UpdatedBy`  = vUserId,
        LS.`UpdatedOn`  = current_timestamp
  where  LS.`StudentID`  = vvStudentId           and
         LS.`Subject`    = vvSubject             And
         LS.`Status`     = cActive               and
         cast(LS.`Date` as date)       >= vDate;
                               
  UPDATE  `worksheetscore` LS
    SET LS.`Status`     = cInActive,
        LS.`UpdatedBy`  = vUserId,
        LS.`UpdatedOn`  = CURRENT_TIMESTAMP
  WHERE  LS.`StudentID`  = vvStudentId           AND
         LS.`Subject`    = vvSubject             AND
         LS.`Status`     = cActive               AND
         CAST(LS.`WorksheetDate` AS DATE) >= vDate; 
     
        
         IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF;
          
                                 
 
                                                    
      /* Fetch the End of the year date against given date for 
         processing lesson plan till end of the year         */  
      SELECT CONCAT(YEAR(vDate), '-12-31') INTO vvEndDate;                                         
                                   
                                     
    
      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = NULL,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW          = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = NULL,
              vvIsHoliday                    = NULL, 
              vvHolidayDesc                  = NULL,
              vvEndTime             = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`   
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
          WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
        SELECT SL.`WSEndNo`, SL.`WSStartNo`  
        INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
          
           SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartingWorkSheetNum is not null then vvStartingWorkSheetNum 
                      when vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     and
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
          
          SELECT S.`StartTime`, S.`EndTime`
          INTO vvStartTime,     vvEndTime
          FROM `slot` S
            JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
          WHERE SS.`StudentID` = vvStudentId AND 
                SS.Subject     = vvSubject   AND
                CAST(SS.`Date` AS DATE)     = vDate
          limit 1;
                
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF;
          
               
                      
          SELECT CASE WHEN vvStartingWorkSheetNum is not null then vvStartingWorkSheetNum
                      when vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN coalesce(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
                      
                      
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
               
          
          SET vvLessonPlanScoreAssignmentID = UUID();          
          
          
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
          IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;           
                                                     
                                                     
         /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
                 
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                    JOIN `lpassignmentheader`  LH ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
                  WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                        (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   Limit 1;
                    
                    IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
             
                    /* Insert Additional Work records if any. Below procedure will take care of this */            
                    CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
                    
                    
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                       INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `Notes`, `CreatedBy`, `CreatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW',0, 0,vNotes, vUserId, 
                                                                  CURRENT_TIMESTAMP, cActive, CURDATE(), NULL;  
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                       INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `FromTime`, `ToTime`, `Notes`, `CreatedBy`, `CreatedOn`,  `Status`, 
                                                                 `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cAssessment, 
                                                                  0, 0, CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes, vUserId, CURRENT_TIMESTAMP,  cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`,  `AdditionalWorkScore`,
                                                                 `Notes`,  `SysMessage`,`CreatedBy`, `CreatedOn`, `Status`, `StartDate`,
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cReviewPacket, 
                                                                  0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId, CURRENT_TIMESTAMP, cActive, CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
                        
            set vvStartingWorkSheetNum = null;   
        
      END WHILE;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel_RepeatLessonPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel_RepeatLessonPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvLessonPlanScoreAssignmentID   
                                     CHAR(38);
  
 
  DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT); 
 
  /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  /* Fetch the header data */
  SELECT LH.`StudentID`,LH.`Subject`,LH.`RequestStartDate`, SL.`Level`,
         LH.`RequestType`, LH.`RequestStartDate`, LH.`RequestEndDate`
  INTO   vvStudentID, vvSubject,  vDate, vvLevelStart,  
         vvRequestType, vvReqStartDate, vvReqEndDate 
  FROM `lpassignmentheader`   LH 
    LEFT JOIN  `studentsubjectlevel`   SL   ON (LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`)
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) 
  ORDER BY FIELD(LH.`IsPermanent`, 0, 1) LIMIT 1;
  
  UPDATE `lessonplanscoreassignment` LS
    SET LS.`Status`     = cInActive,
        LS.`UpdatedBy`  = vUserId,
        LS.`UpdatedOn`  = CURRENT_TIMESTAMP
  WHERE  LS.`StudentID`  = vvStudentId           AND
         LS.`Subject`    = vvSubject             AND
         LS.`Status`     = cActive               AND
         CAST(LS.`Date` AS DATE)  >= vDate;   
        
                               
  UPDATE `worksheetscore` LS
    SET LS.`Status`     = cInActive,
        LS.`UpdatedBy`  = vUserId,
        LS.`UpdatedOn`  = CURRENT_TIMESTAMP
  WHERE  LS.`StudentID`  = vvStudentId           AND
         LS.`Subject`    = vvSubject             AND
         LS.`Status`     = cActive               AND
         CAST(LS.`WorksheetDate` AS DATE)  >= vDate;
   
   
   cALL sp_UpgradeOrDownGradeLevel_AddRepeatSheets (vLPAssignmentHeaderID, @vDate, vUserId);
   
   set vDate = @vDate;
   
      /* Fetch the End of the year date against given date for 
         processing lesson plan till end of the year         */  
      SELECT CONCAT(YEAR(vDate), '-12-31') INTO vvEndDate;                                         
                                                               
    
      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = NULL,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW          = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = NULL,
              vvIsHoliday                    = NULL, 
              vvHolidayDesc                  = NULL,
              vvEndTime             = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
          WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
         SELECT SL.`WSEndNo`, SL.`WSStartNo`  
         INTO   vvWSEndNo, vvWorksheetRangeStart 
         FROM `studentsubjectlevel` SL
         WHERE SL.`StudentID`  = vvStudentId  AND 
               SL.`Subject`    = vvSubject    AND
               SL.`Level`      = vvLevelStart AND
               SL.`Status`     = cActive      and
               SL.`LPAssignmentHeaderID` not in (vLPAssignmentHeaderID)
         LIMIT 1 ;
          
           SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE -- WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum 
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; 
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     -- AND
               -- WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
        
        
          
          SELECT S.`StartTime`, S.`EndTime`
          INTO vvStartTime,     vvEndTime
          FROM `slot` S
            JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
          WHERE SS.`StudentID` = vvStudentId AND 
                SS.Subject     = vvSubject   AND
                CAST(SS.`Date` AS DATE)     = vDate
          limit 1;
                
           
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
              
                      
         SELECT CASE -- WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum
                      WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
                      
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
                       
           
                   
           SET vvLessonPlanScoreAssignmentID = UUID();
           
          
                                         
         INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
         IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
          
                                                     
        /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
            
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                    SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
                
                
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                    JOIN `lpassignmentheader`  LH ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
                  WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                        (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                     JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   limit 1;
                     
                     
                     IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
		   
		  /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
                    
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                       INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `Notes`, `CreatedBy`, `CreatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW',0, 0,vNotes, vUserId, 
                                                                  CURRENT_TIMESTAMP, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                       INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `FromTime`, `ToTime`, `Notes`, `CreatedBy`, `CreatedOn`,  `Status`, 
                                                                 `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cAssessment, 
                                                                  0, 0, CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes, vUserId, CURRENT_TIMESTAMP,  cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`,  `AdditionalWorkScore`,
                                                                 `Notes`,  `SysMessage`,`CreatedBy`, `CreatedOn`, `Status`, `StartDate`,
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cReviewPacket, 
                                                                  0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId, CURRENT_TIMESTAMP, cActive, CURDATE(), NULL;
                                                               
                      END; 
                    END IF;                   
                
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;   
        
             SET vvStartingWorkSheetNum = NULL;
      END WHILE;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpgradeOrDownGradeLevel_UpGradeLevelLessonPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_UpgradeOrDownGradeLevel_UpGradeLevelLessonPlanning`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN
    
  /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  declare vvLessonPlanScoreAssignmentID   
                                     char(38);
  
 
 DROP TABLE IF EXISTS ttworksheetrange;  
  
  CREATE TEMPORARY TABLE ttworksheetrange (RecordId      INT AUTO_INCREMENT PRIMARY KEY,
                                           LEVEL         VARCHAR(25),
                                           WorksheetNum  INT);
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  
  /* Fetch the header data */
  SELECT LH.`StudentID`,LH.`Subject`,LH.`RequestStartDate`, SL.`Level`,
         SL.`WSStartNo`, LH.`RequestStartDate`, LH.`RequestEndDate`, LH.`RequestType`
  INTO vvStudentID, vvSubject,  vDate, vvLevelStart, vvStartingWorkSheetNum, 
       vvReqStartDate, vvReqEndDate, vvRequestType
  FROM `lpassignmentheader`   LH 
    JOIN  `studentsubjectlevel`   SL   ON (LH.`LPAssignmentHeaderID` = SL.`LPAssignmentHeaderID`)
   LEFT JOIN  `studentcenterslot`     SS   ON (LH.`StudentID`            = SS.`StudentID`) AND 
                                              (LH.`Subject`              = SS.`Subject`)   AND
                                              (CAST(SS.`Date` AS DATE)   = vDate)
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) 
  ORDER BY FIELD(LH.`IsPermanent`, 0, 1) LIMIT 1;
  
  
  
  
 /*  Update lesson planning days as InActive during absent days */
  UPDATE `lessonplanscoreassignment` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (cast(LP.`Date` as Date) >= cast(vDate as date)); 
        
/*  Update lesson planning days as InActive during absent days */
  UPDATE `worksheetscore` LP
  SET LP.`UpdatedBy`  = vUserId,
      LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
      LP.`Status`     = cInActive
  WHERE (LP.`StudentID` =  vvStudentID) AND
        (LP.`Subject`   = vvSubject)    AND
        (LP.`Status`    = cActive)      AND
        (CAST(LP.`WorksheetDate` AS DATE) >= CAST(vDate AS DATE));    

			
  
                                                    
      /* Fetch the End of the year date against given date for 
         processing lesson plan till end of the year         */  
      SELECT CONCAT(YEAR(vDate), '-12-31') INTO vvEndDate;                                         
    

      /* Loop through all the dates till the end of the year from given date */
      WHILE (vvEndDate >= vDate) 
        DO 
          SET vvWorkType            = NULL,
              vvNoOfWSOfTheDay      = NULL,
              vvWorksheetRangeEnd   = NULL,
              vvWorksheetRangeStart = NULL,
              vvPrevDayWSNo         = NULL,
              vvIsAssessmentDoneonCW   = 0,
              vvWSEndNo             = NULL,
              vvStartTime           = NULL,
              vvIsHoliday                    = NULL, 
              vvHolidayDesc                  = NULL,
              vvEndTime             = NULL;
        
        
          /* Fetcht the current day work type */
          SELECT LW.`WorkType`, LW.`NoOfWS`
          INTO   vvWorkType,    vvNoOfWSOfTheDay
          FROM `lpworksheetassignment` LW
            JOIN `lpassignmentheader`   LH  ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
          WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                (LW.`DayOfWeek`    = SUBSTRING(DAYNAME(vDate), 1, 3)) AND
                (LW.`WorkType` IN   ('CW', 'HW' ))  AND   
                (LW.`Subject`      = vvSubject) AND 
                (LW.`StudentID`    = vvStudentID) AND
                (LW.`Status`       = cActive)
          ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1;
          
        SELECT SL.`WSEndNo`, SL.`WSStartNo`  
        INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
          
        SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                      ELSE vvWSEndNo END INTO vvWSEndNo;
                      
          SELECT CASE WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum 
                      WHEN vvWorksheetRangeStart IS NULL THEN 1
                      ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart;  
          

          SELECT WS.`WorksheetNum`  
          INTO    vvPrevDayWSNo
          FROM `worksheetscore`WS
          WHERE WS.`StudentID`      = vvStudentID  AND 
                WS.`Subject`        = vvSubject    AND
                WS.`Level`          = vvLevelStart AND 
                WS.`Status`         = 'Active'     AND
                WS.`WorksheetDate`  >=  vvReqStartDate    
         ORDER BY  WS.`WorksheetNum` DESC
         LIMIT 1;
          
          SELECT S.`StartTime`, S.`EndTime`
          INTO vvStartTime,     vvEndTime
          FROM `slot` S
            JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
          WHERE SS.`StudentID` = vvStudentId AND 
                SS.Subject     = vvSubject   AND
                CAST(SS.`Date` AS DATE)     = vDate
          limit 1;
                
          
           IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
               
                      
          SELECT CASE WHEN vvStartingWorkSheetNum IS NOT NULL THEN vvStartingWorkSheetNum
                      WHEN vvPrevDayWSNo IS NULL OR vvPrevDayWSNo = 0 OR
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE  vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > vvWSEndNo THEN vvWSEndNo
                       ELSE (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) END INTO vvWorksheetRangeEnd;
                       
          
                   
           SET vvLessonPlanScoreAssignmentID = UUID();
           
          
                                         
         INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`, `FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT vvLessonPlanScoreAssignmentID, vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END,
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
          IF(vvWorkType IS NOT NULL) THEN
            
            CALL sp_GenerateNum (vvWorksheetRangeStart, vvWorksheetRangeEnd, vvLevelStart);
                                                     
            CALL sp_InsertWorksheetAssignment (vvLessonPlanScoreAssignmentID, vUserId); 
            
            END IF;          
          
                                                     
        /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
           
          IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              WHILE (vvIsAssessmentDoneonCW = 0) 
                DO
                
                  
                  SET vvWorkType                     = NULL,
                      vvStartTime                    = NULL,
                      vvIsHoliday                    = NULL, 
                      vvHolidayDesc                  = NULL,
                      vvEndTime                      = NULL;
   
                  SELECT DATE_ADD((vDate),INTERVAL 1 DAY) INTO vDate;
                  
                  /*  Get the WorkType of the next day after 200th sheet */
                  SELECT LW.`WorkType`
                  INTO   vvWorkType
                  FROM `lpworksheetassignment` LW
                    JOIN `lpassignmentheader`  LH ON LH.`LPAssignmentHeaderID` = LW.`LPAssignmentHeaderID`
                  WHERE (LW.`LPAssignmentHeaderID` = vLPAssignmentHeaderID) AND
                        (LW.`DayOfWeek` = SUBSTRING(DAYNAME(vDate), 1, 3))  AND 
                        (LW.`WorkType` IN   ('CW', 'HW' ))  AND 
                        (LW.`Subject`      = vvSubject)                     AND 
                        (LW.`StudentID`    = vvStudentID)                   AND
                        (LW.`Status`       = cActive)
                   ORDER BY FIELD(LW.`IsPermanent`, 0, 1) LIMIT 1; 
                   
                   SELECT S.`StartTime`, S.`EndTime`
                   INTO vvStartTime, vvEndTime
                   FROM `slot` S
                    JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
                   WHERE SS.`StudentID` = vvStudentId AND 
                         SS.Subject     = vvSubject   AND
                         CAST(SS.`Date` AS DATE)     = vDate
                   limit 1;
                     
            IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
             SELECT 1, HolidayDesc, cHWWorkType 
             INTO vvIsHoliday, vvHolidayDesc, vvWorkType
             FROM `holiday`
             WHERE HolidayDate = vDate;
             
          END IF; 
		   
		   /* Insert Additional Work records if any. Below procedure will take care of this */            
          CALL sp_GetAdditionalWorkByDate (NULL, vLPAssignmentHeaderID, vDate, vvLevelStart, vUserId);
                    
                    /* If next day is Sunday or Holiday */
                    IF (vvWorkType IS NULL) THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `Notes`, `CreatedBy`, `CreatedOn`, `Status`, `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, 'NW',0, 0,vNotes, vUserId, 
                                                                  CURRENT_TIMESTAMP, cActive, CURDATE(), NULL; 
                      
                      END;
                      END IF;
                      
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'CW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`, `AdditionalWorkScore`, 
                                                                 `FromTime`, `ToTime`, `Notes`, `CreatedBy`, `CreatedOn`,  `Status`, 
                                                                 `StartDate`, `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cAssessment, 
                                                                  0, 0, CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                                  CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,
                                                                  vNotes, vUserId, CURRENT_TIMESTAMP,  cActive, CURDATE(), NULL; 
                                                               
                        SET vvIsAssessmentDoneonCW   = 1, 
                            vvSubjectLevel = CONCAT(vvSubject, 'Level'); 
          
                     
                        /* Fetch next level */       
                        SELECT  `SortOrder`
                        INTO vvCurSortOrderLevel 
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `StringMapName` = vvLevelStart AND 
                              `Status`        = cActive
                        limit 1;
           
           
                        SELECT (vvCurSortOrderLevel + 1) INTO vvCurSortOrderLevel;
           
                        SELECT  `StringMapName`, 1
                        INTO  vvLevelStart, vvWorksheetRangeStart
                        FROM `stringmap`
                        WHERE `StringMapType` = vvSubjectLevel AND 
                              `SortOrder`     =  vvCurSortOrderLevel AND
                              `Status`        = cActive
                        limit 1;                                                             
                    
                      END; 
                    END IF;                  
                      
                    /* If next day is CW */
                    IF (vvWorkType = 'HW') THEN
                      BEGIN
                        INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, 
                                                                 `Date`, `WorkType`, `TimeTakenInSeconds`,  `AdditionalWorkScore`,
                                                                 `Notes`,  `SysMessage`,`CreatedBy`, `CreatedOn`, `Status`, `StartDate`,
                                                                 `EndDate`)
                                                           SELECT UUID(), vvStudentId, vvSubject, vDate, cReviewPacket, 
                                                                  0, 0, vNotes, 
                                                                  CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                                  vUserId, CURRENT_TIMESTAMP, cActive, CURDATE(), NULL; 
                                                               
                      END; 
                    END IF;                   
                
                
              END WHILE;  /*  While end for review packets/Assessments */                                          
            END;
            END IF;
              
            SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
                        ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;   
        
            SET vvStartingWorkSheetNum = NULL;           
        
      END WHILE;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WSMove_PostponeWorkSheetToNextDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_WSMove_PostponeWorkSheetToNextDay`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN 

 /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvNewSlotId                CHAR(38);
  DECLARE vvLatestLPAssignmentHeaderID
                                     CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvNewWSCount               INT;
  DECLARE vvSpecialActivity          VARCHAR(100);
  DECLARE vvRequestText              VARCHAR(100);
  DECLARE vvSysMessage               VARCHAR(100);       
  DECLARE vvFromTime                 TIME;
  DECLARE vvExtToTime                TIME;
  DECLARE vvWSCount                  INT;
  DECLARE vvExtSpecialActivity       VARCHAR(100);
  DECLARE vvExtRequestText           VARCHAR(100);
  DECLARE vvExtSysMessage            VARCHAR(100);
  DECLARE vvExtWorkType              VARCHAR(100);       
  DECLARE vvExtFromTime              TIME;
  
  
  DECLARE vvExtWSCount               INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvIsPermanent              BIT;
  DECLARE cProcessed                 VARCHAR(50);
  DECLARE vRecordId                  INT;
  declare vvMoveWSNo                 int;
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done in Class only';
  
  
  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`, LH.`Subject`, DATE_ADD((LH.`RequestStartDate`),INTERVAL 1 DAY),
         LH.`IsPermanent`, COALESCE(LH.`RequestEndDate`,CONCAT(YEAR(LH.`RequestStartDate`), '-12-31')),
         LH.`RequestStartDate`, LM.`WorkSheetNo`, LM.`Level`
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate, 
         vvReqStartDate, vvMoveWSNo, vvLevelStart
  FROM `lpassignmentheader` LH 
    join `lpwsmoverequest` LM on LH.`LPAssignmentHeaderID` = LM.`LPAssignmentHeaderID`
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  LIMIT 1;  
  
  
  
  SELECT `LPAssignmentHeaderID`
  INTO   vvLatestLPAssignmentHeaderID
  FROM `lpworksheetassignment` lwa1 
  WHERE StudentID   = vvStudentID   AND 
        SUBJECT     = vvSubject     AND 
        IsPermanent = b'1'          AND
        STATUS = cActive            AND 
        NOT EXISTS (SELECT 1 FROM `lpworksheetassignment` lwa2 WHERE lwa2.studentid = lwa1.studentid AND 
                                                                   lwa2.subject = lwa1.subject AND 
                                                                   lwa2.IsPermanent = b'1' AND 
                                                                   lwa2.status = 'Active'  AND 
                                                                   lwa2.createdon > lwa1.createdon)
                                                                   LIMIT 1;
   DROP TEMPORARY  TABLE  IF EXISTS tttemplpworksheetassignment;
   
   CREATE TEMPORARY TABLE ttTempLPWorkSheetAssignment (WorkType      VARCHAR(50), 
                                                       WeekDayName   VARCHAR(50),   
                                                       NoOfWS        INT,
                                                       Note          TEXT);
                                                       
  INSERT INTO ttTempLPWorkSheetAssignment (WorkType, WeekDayName, NoOfWS, Note)
                                   SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                   FROM `lpworksheetassignment` 
                                   WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;   
                                                                      
  
  SET vvEndDate        = CONCAT(YEAR(vDate), '-12-31');
  SET vvSubjectLevel   = CONCAT(vvSubject, 'Level');
  
  
  update `lessonplanscoreassignment` 
  set `WorksheetRangeEnd` = vvMoveWSNo - 1,
      `UpdatedBy`         = vUserId,
      `UpdatedOn`         = current_timestamp     
  where `StudentID`   = vvStudentId     and
        `Subject`     = vvSubject       and
        `LevelStart`  = vvLevelStart    and 
        `Date`        = vvReqStartDate  and 
        `Status`      = cActive;
      
   
        
  WHILE(vvEndDate >= vDate) 
    DO
      /*Reset the values here */
      SET vvWorkType                     = NULL,
          vvNewSlotId                    = NULL, 
          vvStartTime                    = NULL, 
          vvEndTime                      = NULL,
          vvExtSpecialActivity           = NULL,
          vvExtRequestText               = NULL,
          vvSysMessage                   = NULL,
          vvExtWorkType                  = NULL,
          vvExtFromTime                  = NULL,
          vvExtToTime                    = NULL,
          vvWorksheetRangeStart          = NULL,
          vvPrevDayWSNo                  = NULL,
          vvExtWSCount                   = NULL;
            
         
          
     SELECT `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
            `FromTime`, `ToTime`, (`WorksheetRangeEnd` - `WorksheetRangeStart` +1)
     INTO   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
            vvExtWorkType, vvExtFromTime,  vvExtToTime, vvExtWSCount
     FROM `lessonplanscoreassignment` 
     WHERE `StudentID`   =  vvStudentId    AND
           `Subject`     =  vvSubject      AND
           `Date`        =  vDate          AND
           `WorkType`   NOT IN ('AW','NW') AND
           `Status`      =  cActive
     LIMIT 1;
     
   
     
     SELECT SL.`WSEndNo`, SL.`WSStartNo`  
       INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
         
         
              
       SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                   ELSE vvWSEndNo END INTO vvWSEndNo;
        
       /* SELECT CASE WHEN vvWorksheetRangeStart IS NULL  THEN 1
                   ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; */
        
         SELECT  WorkType,   NoOfWS
         INTO    vvWorkType, vvNoOfWSOfTheDay
         FROM ttTempLPWorkSheetAssignment        
         WHERE  WeekDayName = SUBSTRING(DAYNAME(vDate), 1, 3) AND
                WorkType IN ('HW', 'CW')
         LIMIT 1;
           
          
        
      /* Get this from a variable */ 
          SELECT LH.`WorksheetRangeEnd`  
          INTO    vvPrevDayWSNo
          FROM `lessonplanscoreassignment` LH
          WHERE LH.`StudentID`      = vvStudentID   AND 
                LH.`Subject`        = vvSubject     AND
                LH.`LevelStart`     = vvLevelStart  AND 
                LH.`Status`         = cActive       AND 
                LH.`Date`           < vDate         AND
                LH.`WorkType`       NOT IN ('Absent', 'AW', 'NW') AND 
                LH.`WorksheetRangeEnd` <> 0
          ORDER BY  `WorksheetRangeEnd` DESC LIMIT 1;
          
            
            IF(EXISTS(SELECT 1 FROM Holiday WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1,           HolidayDesc,   cHWWorkType 
                      INTO   vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM Holiday
                      WHERE HolidayDate = vDate
                      LIMIT 1;
             
             END IF;  
             
     IF (IFNULL(vvNoOfWSOfTheDay, 0) = 0) THEN
      SET vvWorkType = NULL;
     END IF;  
  
  AbsentExitHandler: BEGIN 
  NullWorkTypeExitHandler: BEGIN     
  
  
     /* Existing requests related records and if any we should not override the existing request related changes */
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtWorkType IN ('Absent')) THEN
         
         SET vvExtWorkType = 'Absent';
         LEAVE AbsentExitHandler;  
     
      END IF;
    IF (vvWorkType IS NULL) THEN
         
         LEAVE NullWorkTypeExitHandler;  
     
      END IF;
      
      IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('Concept', 'Correction')) AND
         (vDate <> vvReqStartDate) THEN
         
           SELECT cCWWorkType, 0,                0,             vvExtSpecialActivity              
           INTO   vvWorkType,  vvNoOfWSOfTheDay, vvPrevDayWSNo, vvSpecialActivity;
      END IF;
      
      IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('PickupWork')) THEN
         
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
       END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SD')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity,  vvExtToTime
           INTO   vvWorkType,  vvSpecialActivity,     vvEndTime;  
        END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SH')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, FLOOR(IFNULL(vvNoOfWSOfTheDay, 0)*3)
           INTO   vvWorkType,  vvSpecialActivity,    vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
        END IF;
        
        IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_ST')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, FLOOR(IFNULL(vvNoOfWSOfTheDay, 0)*1.5)
           INTO   vvWorkType,  vvSpecialActivity, vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
         END IF;
         
         IF (EXISTS(SELECT 1 FROM `holiday` WHERE `HolidayDesc` = vvExtSysMessage AND `Status` = cActive)) THEN
           
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
         END IF;
         
 END NullWorkTypeExitHandler;
  
   
   IF(vvWorkType = cCWWorkType) THEN 
            
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
             LIMIT 1;
            
            END IF;
            
  /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR 
                           vvPrevDayWSNo = 0    OR 
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > IFNULL(vvWSEndNo, 0) THEN vvWSEndNo
                       ELSE ((vvWorksheetRangeStart +  vvNoOfWSOfTheDay -1)) END INTO vvWorksheetRangeEnd;
         
         
         
         IF (COALESCE(vvExtWorkType, '') <> 'Absent') THEN
         
          
          
         /*  Update lesson planning days as InActive and initilize 
              the lesson planning again from the requested date */
              UPDATE `lessonplanscoreassignment` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vvStudentID)  AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (LP.`WorkType`  NOT IN ('AW'))  AND
                    (CAST(LP.`Date` AS DATE) =    vDate); 
                    
  
          
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `LevelStart`, `WorksheetRangeStart`, `LevelEnd`, `WorksheetRangeEnd`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`,  `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT UUID(), vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     vvLevelStart, 
                                                     CASE WHEN vvWorkType IS NULL THEN 0 ELSE vvWorksheetRangeStart END,
                                                     vvLevelStart, 
                                                     CASE WHEN vvWorkType IS NULL THEN 0 ELSE vvWorksheetRangeEnd END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
          
     IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              
              
              CALL sp_AssessmentOrReviewPacketPlanning (vDate, vLPAssignmentHeaderID, vUserId, vvStudentId, vvSubject, vvLevelStart, @vOutLevel, @vOutDate);
              
              SET vDate        =  @vOutDate,
                  vvLevelStart =  @vOutLevel; 
                    
          END;
            END IF;
          END IF;  
     
     
     
   END AbsentExitHandler;        

 SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
               ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
    
    END WHILE;
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WSMove_PreponeWorkSheetToCurrentDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_WSMove_PreponeWorkSheetToCurrentDay`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN 

 /* Delcare the variables here */
  DECLARE IsCWonCWOnly               VARCHAR(50);
  DECLARE cActive                    VARCHAR(50);
  DECLARE IsPlanFinished             INT;
  DECLARE vvTotalWSOfTheDay          INT;
  DECLARE vvPrevDayWSNo              INT;
  DECLARE vvNoOfWSOfTheDay           INT;
  DECLARE vvWorkType                 VARCHAR(50);
  DECLARE vvLevelStart               VARCHAR(50);
  DECLARE vvStudentID                CHAR(38);
  DECLARE vvNewSlotId                CHAR(38);
  DECLARE vvLatestLPAssignmentHeaderID
                                     CHAR(38);
  DECLARE vvStartingLevel            INT;
  DECLARE vvStartingWorkSheetNum     INT;
  DECLARE vvSubject                  VARCHAR(50); 
  DECLARE vvNoOfWS                   INT;
  DECLARE vvEndOfWSNum               INT;
  DECLARE vvWSStartDate              DATE;
  DECLARE vvEndDate                  DATE;
  DECLARE vvWorksheetRangeStart      INT;
  DECLARE vvWorksheetRangeEnd        INT;
  DECLARE vvCurSortOrderLevel        INT;
  DECLARE vvCWDay                    VARCHAR(10);
  DECLARE vvIsAssessmentDoneonCW     BIT;
  DECLARE cAssessment                VARCHAR(25);
  DECLARE cReviewPacket              VARCHAR(25);
  DECLARE cInActive                  VARCHAR(25);
  DECLARE vvSubjectLevel             VARCHAR(50);
  DECLARE vvCurrDate                 DATETIME;
  DECLARE vvWSStartNo                INT;
  DECLARE vvWSEndNo                  INT;
  DECLARE vvRequestType              VARCHAR(50);
  DECLARE vvIsPlanFinished           INT;
  DECLARE vvReqStartDate             DATE;
  DECLARE vvReqEndDate               DATE;
  DECLARE vvNoOfDaysCWtoCW           INT;
  DECLARE vvCWtoCWEndDate            DATE;
  DECLARE cCWWorkType                VARCHAR(20);
  DECLARE cHWWorkType                VARCHAR(20);
  DECLARE vvNoOfWSforAbsentCW        INT;
  DECLARE vvNoOfWSRemaining          INT;
  DECLARE vvDaysToLoops              INT;
  DECLARE vvStartCWLoop              INT;
  DECLARE cAbsent                    VARCHAR(50);
  DECLARE vvIsCWAssignment           BIT;
  DECLARE vvSysMsg                   VARCHAR(150);
  DECLARE vvStartTime                TIME;
  DECLARE vvEndTime                  TIME;
  DECLARE vvNewWSCount               INT;
  DECLARE vvSpecialActivity          VARCHAR(100);
  DECLARE vvRequestText              VARCHAR(100);
  DECLARE vvSysMessage               VARCHAR(100);       
  DECLARE vvFromTime                 TIME;
  DECLARE vvExtToTime                TIME;
  DECLARE vvWSCount                  INT;
  DECLARE vvExtSpecialActivity       VARCHAR(100);
  DECLARE vvExtRequestText           VARCHAR(100);
  DECLARE vvExtSysMessage            VARCHAR(100);
  DECLARE vvExtWorkType              VARCHAR(100);       
  DECLARE vvExtFromTime              TIME;
  
  
  DECLARE vvExtWSCount               INT;
  DECLARE vvIsHoliday                BIT;
  DECLARE vvHolidayDesc              VARCHAR(200);
  DECLARE vvIsPermanent              BIT;
  DECLARE cProcessed                 VARCHAR(50);
  DECLARE vRecordId                  INT;
  declare vvMoveWSNo                 int;
 
 
 /* Initialize or fetch the valuees here */         
  SET cActive                     = 'Active';
  SET cInActive                   = 'InActive';
  SET vvIsPlanFinished            = 0;
  SET vvCurrDate                  = CURRENT_TIMESTAMP;
  SET vvIsAssessmentDoneonCW      = 0;
  SET cAssessment                 = 'Assessment';
  SET cReviewPacket               = 'Review Packet';
  SET vvSubjectLevel              = CONCAT(vvSubject, 'Level');
  SET cCWWorkType                 = 'CW';
  SET cHWWorkType                 = 'HW';
  SET vvStartCWLoop               = 1;
  SET cAbsent                     = 'Absent';
  SET vvSysMsg                    = 'Work can be done in Class only';
  
  
  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`, LH.`Subject`, LH.`RequestStartDate`,
         LH.`IsPermanent`, COALESCE(LH.`RequestEndDate`,CONCAT(YEAR(LH.`RequestStartDate`), '-12-31')),
         LH.`RequestStartDate`, LM.`WorkSheetNo`, LM.`Level`
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate, 
         vvReqStartDate, vvMoveWSNo, vvLevelStart
  FROM `lpassignmentheader` LH 
    join `lpwsmoverequest` LM on LH.`LPAssignmentHeaderID` = LM.`LPAssignmentHeaderID`
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  LIMIT 1;  
  
  
  
  SELECT `LPAssignmentHeaderID`
  INTO   vvLatestLPAssignmentHeaderID
  FROM `lpworksheetassignment` lwa1 
  WHERE StudentID   = vvStudentID   AND 
        SUBJECT     = vvSubject     AND 
        IsPermanent = b'1'          AND
        STATUS = cActive            AND 
        NOT EXISTS (SELECT 1 FROM lpworksheetassignment lwa2 WHERE lwa2.studentid = lwa1.studentid AND 
                                                                   lwa2.subject = lwa1.subject AND 
                                                                   lwa2.IsPermanent = b'1' AND 
                                                                   lwa2.status = 'Active'  AND 
                                                                   lwa2.createdon > lwa1.createdon)
                                                                   LIMIT 1;
   DROP TEMPORARY  TABLE  IF EXISTS tttemplpworksheetassignment;
   
   CREATE TEMPORARY TABLE ttTempLPWorkSheetAssignment (WorkType      VARCHAR(50), 
                                                       WeekDayName   VARCHAR(50),   
                                                       NoOfWS        INT,
                                                       Note          TEXT);
                                                       
  INSERT INTO ttTempLPWorkSheetAssignment (WorkType, WeekDayName, NoOfWS, Note)
                                   SELECT `WorkType`, `DayOfWeek`, `NoOfWS`, `Note`
                                   FROM lpworksheetassignment 
                                   WHERE   LPAssignmentHeaderID = vvLatestLPAssignmentHeaderID;   
                                                                      
  
  SET vvEndDate        = CONCAT(YEAR(vDate), '-12-31');
  SET vvSubjectLevel   = CONCAT(vvSubject, 'Level');

   
        
  WHILE(vvEndDate >= vDate) 
    DO
      /*Reset the values here */
      SET vvWorkType                     = NULL,
          vvNewSlotId                    = NULL, 
          vvStartTime                    = NULL, 
          vvEndTime                      = NULL,
          vvExtSpecialActivity           = NULL,
          vvExtRequestText               = NULL,
          vvSysMessage                   = NULL,
          vvExtWorkType                  = NULL,
          vvExtFromTime                  = NULL,
          vvExtToTime                    = NULL,
          vvWorksheetRangeStart          = NULL,
          vvPrevDayWSNo                  = NULL,
          vvExtWSCount                   = NULL;
            
         
          
     SELECT `SpecialActivity`, `RequestText`, `SysMessage`, `WorkType`,
            `FromTime`, `ToTime`, (`WorksheetRangeEnd` - `WorksheetRangeStart` +1)
     INTO   vvExtSpecialActivity, vvExtRequestText, vvSysMessage, 
            vvExtWorkType, vvExtFromTime,  vvExtToTime, vvExtWSCount
     FROM `lessonplanscoreassignment` 
     WHERE `StudentID`   =  vvStudentId    AND
           `Subject`     =  vvSubject      AND
           `Date`        =  vDate          AND
           `WorkType`   NOT IN ('AW','NW') AND
           `Status`      =  cActive
     LIMIT 1;
     
   
     
     SELECT SL.`WSEndNo`, SL.`WSStartNo`  
       INTO   vvWSEndNo, vvWorksheetRangeStart 
        FROM `studentsubjectlevel` SL
        WHERE SL.`StudentID`  = vvStudentId  AND 
              SL.`Subject`    = vvSubject    AND
              SL.`Level`      = vvLevelStart AND
              SL.`Status`     = cActive
         LIMIT 1;
         
         
              
       SELECT CASE WHEN vvWSEndNo IS NULL THEN 200
                   ELSE vvWSEndNo END INTO vvWSEndNo;
        
       /* SELECT CASE WHEN vvWorksheetRangeStart IS NULL  THEN 1
                   ELSE vvWorksheetRangeStart END INTO vvWorksheetRangeStart; */
        
         SELECT  WorkType,   NoOfWS
         INTO    vvWorkType, vvNoOfWSOfTheDay
         FROM ttTempLPWorkSheetAssignment        
         WHERE  WeekDayName = SUBSTRING(DAYNAME(vDate), 1, 3) AND
                WorkType IN ('HW', 'CW')
         LIMIT 1;
           
          
        
      /* Get this from a variable */ 
          SELECT LH.`WorksheetRangeEnd`  
          INTO    vvPrevDayWSNo
          FROM `lessonplanscoreassignment` LH
          WHERE LH.`StudentID`      = vvStudentID   AND 
                LH.`Subject`        = vvSubject     AND
                LH.`LevelStart`     = vvLevelStart  AND 
                LH.`Status`         = cActive       AND 
                LH.`Date`           < vDate         AND
                LH.`WorkType`       NOT IN ('Absent', 'AW', 'NW') AND 
                LH.`WorksheetRangeEnd` <> 0
          ORDER BY  `WorksheetRangeEnd` DESC LIMIT 1;
          
            
            IF(EXISTS(SELECT 1 FROM `holiday` WHERE HolidayDate = vDate AND STATUS = 'Active')) THEN
            
                      SELECT 1,           HolidayDesc,   cHWWorkType 
                      INTO   vvIsHoliday, vvHolidayDesc, vvWorkType
                      FROM `holiday`
                      WHERE HolidayDate = vDate
                      LIMIT 1;
             
             END IF;  
             
     IF (IFNULL(vvNoOfWSOfTheDay, 0) = 0) THEN
      SET vvWorkType = NULL;
     END IF;  
  
  AbsentExitHandler: BEGIN 
  NullWorkTypeExitHandler: BEGIN     
  
  
     /* Existing requests related records and if any we should not override the existing request related changes */
     IF (vvExtSpecialActivity IS NOT NULL AND vvExtWorkType IN ('Absent')) THEN
         
         SET vvExtWorkType = 'Absent';
         LEAVE AbsentExitHandler;  
     
      END IF;
    IF (vvWorkType IS NULL) THEN
         
         LEAVE NullWorkTypeExitHandler;  
     
      END IF;
      IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('Concept', 'Correction')) AND
         (vDate <> vvReqStartDate) THEN
         
           SELECT cCWWorkType, 0,                0,             vvExtSpecialActivity              
           INTO   vvWorkType,  vvNoOfWSOfTheDay, vvPrevDayWSNo, vvSpecialActivity;
      END IF;
      
      IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity IN ('PickupWork')) THEN
         
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
       END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SD')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity,  vvExtToTime
           INTO   vvWorkType,  vvSpecialActivity,     vvEndTime;  
        END IF;
       
       IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_SH')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, FLOOR(IFNULL(vvNoOfWSOfTheDay, 0)*3)
           INTO   vvWorkType,  vvSpecialActivity,    vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
        END IF;
        
        IF (vvExtSpecialActivity IS NOT NULL AND vvExtSpecialActivity  IN ('MakeupRequest_ST')) THEN
         
           SELECT cCWWorkType, vvExtSpecialActivity, vvExtFromTime, vvExtToTime, FLOOR(IFNULL(vvNoOfWSOfTheDay, 0)*1.5)
           INTO   vvWorkType,  vvSpecialActivity, vvStartTime,   vvEndTime,   vvNoOfWSOfTheDay;  
         END IF;
         
         IF (EXISTS(SELECT 1 FROM `holiday` WHERE `HolidayDesc` = vvExtSysMessage AND `Status` = cActive)) THEN
           
           SELECT cHWWorkType, vvExtSpecialActivity 
           INTO   vvWorkType,  vvSpecialActivity;
           
         END IF;
         
 END NullWorkTypeExitHandler;
  
   
   IF(vvWorkType = cCWWorkType) THEN 
            
              SELECT S.`StartTime`, S.`EndTime`
              INTO vvStartTime,     vvEndTime
              FROM `slot` S
                JOIN `studentcenterslot` SS ON S.`SlotID` = SS.`SlotID`
              WHERE SS.`StudentID`          = vvStudentId AND 
                    SS.Subject              = vvSubject   AND
                    CAST(SS.`Date` AS DATE) = vDate
             LIMIT 1;
            
            END IF;
            
  /* Set the Work sheet range */
          SELECT CASE WHEN vvPrevDayWSNo IS NULL OR 
                           vvPrevDayWSNo = 0    OR 
                           vvPrevDayWSNo = vvWSEndNo THEN COALESCE(vvWorksheetRangeStart, 1)
                      ELSE vvPrevDayWSNo + 1 END INTO vvWorksheetRangeStart;
         
          SELECT  CASE WHEN (vvWorksheetRangeStart +  vvNoOfWSOfTheDay - 1) > IFNULL(vvWSEndNo, 0) THEN vvWSEndNo
                       ELSE ((vvWorksheetRangeStart +  vvNoOfWSOfTheDay -1)) END INTO vvWorksheetRangeEnd;
         
         
         
         IF (COALESCE(vvExtWorkType, '') <> 'Absent') THEN
         
          
          
         /*  Update lesson planning days as InActive and initilize 
              the lesson planning again from the requested date */
              UPDATE `lessonplanscoreassignment` LP
              SET LP.`UpdatedBy`  = vUserId,
                  LP.`UpdatedOn`  = CURRENT_TIMESTAMP,
                  LP.`Status`     = cInActive
              WHERE (LP.`StudentID` = vvStudentID)  AND
                    (LP.`Subject`   = vvSubject)    AND
                    (LP.`Status`    = cActive)      AND
                    (LP.`WorkType`  NOT IN ('AW'))  AND
                    (CAST(LP.`Date` AS DATE) =    vDate); 
                    
  
          
          /* Insert the details into lessonplanscoreassignment */                     
          INSERT INTO `lessonplanscoreassignment` (`LessonPlanScoreAssignmentID`, `StudentID`, `Subject`, `Date`, `WorkType`,  
                                                    `LevelStart`, `WorksheetRangeStart`, `LevelEnd`, `WorksheetRangeEnd`,  
                                                    `TimeTakenInSeconds`, `AdditionalWorkScore`,`FromTime`, `ToTime`,
                                                     `Notes`, `SpecialActivity`, `SysMessage`, `CreatedBy`, `UpdatedBy`, 
                                                    `CreatedOn`, `UpdatedOn`, `Status`, `StartDate`, `EndDate`)
                                              SELECT UUID(), vvStudentId, vvSubject, vDate, 
                                                     CASE WHEN vvWorkType IS NULL THEN 'NW' ELSE vvWorkType END,
                                                     vvLevelStart, 
                                                     CASE WHEN vvWorkType IS NULL THEN 0 ELSE vvWorksheetRangeStart END,
                                                     vvLevelStart, 
                                                     CASE WHEN vvWorkType IS NULL THEN 0 ELSE vvWorksheetRangeEnd END,
                                                     NULL, NULL,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvStartTime ELSE NULL END,
                                                     CASE WHEN  vvWorkType = 'CW' THEN vvEndTime ELSE NULL END,    
                                                     vNotes, 
                                                     case when vDate = vvReqStartDate then vvExtSpecialActivity else null end, 
                                                     CASE WHEN vvIsHoliday = 1 THEN vvHolidayDesc ELSE NULL END, 
                                                     vUserId, NULL, CURRENT_TIMESTAMP, NULL, cActive, CURDATE(), NULL;
                                                     
          
     IF (vvWorksheetRangeEnd = vvWSEndNo) THEN 
            BEGIN 
              
              
              CALL sp_AssessmentOrReviewPacketPlanning (vDate, vLPAssignmentHeaderID, vUserId, vvStudentId, vvSubject, vvLevelStart, @vOutLevel, @vOutDate);
              
              SET vDate        =  @vOutDate,
                  vvLevelStart =  @vOutLevel; 
                    
          END;
            END IF;
          END IF;  
     
     
     
   END AbsentExitHandler;        

 SELECT CASE WHEN vvLevelStart IS NULL THEN DATE_ADD((vvEndDate),INTERVAL 1 DAY)
               ELSE DATE_ADD((vDate),INTERVAL 1 DAY) END INTO vDate;
    
    END WHILE;
  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WSMove_RegularToCorrectionDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_WSMove_RegularToCorrectionDay`(
  IN vAction                 VARCHAR(50),
  IN vLPAssignmentHeaderID   CHAR(36),
  IN vDate                   DATE,
  IN vNotes                  VARCHAR(500),
  IN vUserId                 VARCHAR(40),
  IN vStartDate              DATE,
  IN vEndDate                DATE
)
BEGIN 

 declare cCorrection    varchar(50);
 DECLARE vvSubject      VARCHAR(50); 
 DECLARE vvStudentID    CHAR(38);  
 DECLARE vvIsPermanent  bit; 
 declare vvReqEndDate   date; 
 DECLARE vvReqStartDate DATE; 
 declare vvLevelStart   VARCHAR(50); 
 
 /* Initialize or fetch the valuees here */         
  SET cCorrection       = 'Correction';
  
  
  
  
  /* Fetch all the details related to the request header */
  SELECT LH.`StudentID`, LH.`Subject`, LH.`RequestStartDate`,
         LH.`IsPermanent`, COALESCE(LH.`RequestEndDate`,CONCAT(YEAR(LH.`RequestStartDate`), '-12-31')),
         LH.`RequestStartDate`, LM.`Level`
  INTO   vvStudentID,   vvSubject, vDate, vvIsPermanent, vvReqEndDate, 
         vvReqStartDate, vvLevelStart
  FROM `lpassignmentheader` LH 
    join `lpwsmoverequest` LM on LH.`LPAssignmentHeaderID` = LM.`LPAssignmentHeaderID`
  WHERE (LH.`LPAssignmentHeaderID` = vLPAssignmentHeaderID)
  LIMIT 1;  
  
  
  
  
  /* Update Special Activity as Correction day */
  update `lessonplanscoreassignment` 
  set `SpecialActivity`   = cCorrection,
      `UpdatedBy`         = vUserId,
      `UpdatedOn`         = current_timestamp     
  where `StudentID`   = vvStudentId     and
        `Subject`     = vvSubject       and
        `LevelStart`  = vvLevelStart    and 
        `Date`        = vvReqStartDate  and 
        `Status`      = cActive;
      
   

  
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubjectRequestDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `SubjectRequestDetail`(
 IN vLPAssignmentHeaderID        CHAR(38)      
    )
BEGIN

			SELECT s.FirstName AS  stFirstName ,s.LastName AS stLastName ,p.FirstName AS prFirstName ,p.LastName AS prLastName,
			lp.Subject,lp.RequestType,lp.RequestDate,lp.ApprovalDate,lp.ReasonCode,lp.ReasonOther,lp.SubmittedBy,lp.CreatedBy
			 FROM `lpassignmentheader` AS lp
			LEFT JOIN `student` AS s ON s.StudentID = lp.StudentID
			LEFT JOIN `parent` AS p ON p.ParentID = lp.CreatedBy
			WHERE `LPAssignmentHeaderID` = vLPAssignmentHeaderID;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TakeWorkSheetByDateandSubStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `TakeWorkSheetByDateandSubStudent`(
  IN vStudentID        char(38)  ,
  IN vSubject        varchar(50)  ,
  IN vDate       Date
)
BEGIN
  
  SELECT SC.*,SubTable.currentWS FROM `lessonplanscoreassignment` AS SC 
LEFT JOIN (

SELECT STATUS,SUBJECT,StudentID,WorksheetDate,COUNT(*) AS currentWS FROM `worksheetscore`   
WHERE STATUS = 'Active' AND StudentID =vStudentID 
AND SUBJECT = vSUBJECT AND WorksheetDate = vDATE


) AS SubTable ON SubTable.Status = SC.Status AND SubTable.SUBJECT = SC.Subject AND SubTable.WorksheetDate = SC.Date AND SubTable.StudentID = SC.StudentID 
WHERE SC.status = 'Active' AND SC.StudentID =vStudentID
AND SC.Subject = vSUBJECT AND SC.Date = vDATE;

 
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tmp_studentslotassignment_entry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `tmp_studentslotassignment_entry`()
BEGIN
	
	INSERT INTO `lcmdev`.`studentslotassignmentrequest` (
  `StudentSlotAssignmentRequestID`,
  `RequestDate`,
  `Subject`,
  `StudentID`,
  `IsPermanent`,
  `RequestStartDate`,
  `RequestEndDate`,
  `Status`,
  `CreatedBy`,
  `CreatedOn`
  
)
VALUES
  (
    'ae300b95-7ad1-11e8-bb6d-1c1b0d291734',
    '2018-06-27',
    'Reading',
    '071d28c0-75fc-11e8-b761-896d277620ce',
    '0',
    '2018-08-16',
    '2018-09-15',
    'Pending',
    '596ff8b0-79fc-11e8-bfbf-2518e01aa7d2',
    '2018-06-28'
  );
  
	
	
	
	INSERT INTO `lcmdev`.`studentslotassignmentrequestdetail` (
  `StudentSlotAssignmentRequestDetailID`,
  `StudentSlotAssignmentRequestID`,
  `RequestType`,
  `DayOfWeek`,
  `SlotID`,
  `CreatedBy`,
  `CreatedOn`,
  `Status`
)
VALUES
  (UUID(),'ae300b95-7ad1-11e8-bb6d-1c1b0d291734','REMOVE','Tue','e7888282-7567-11e8-bb6d-1c1b0d291734','596ff8b0-79fc-11e8-bfbf-2518e01aa7d2','2018-06-28','Pending'),
  (UUID(),'ae300b95-7ad1-11e8-bb6d-1c1b0d291734','REMOVE','Fri','e78881f0-7567-11e8-bb6d-1c1b0d291734','596ff8b0-79fc-11e8-bfbf-2518e01aa7d2','2018-06-28','Pending'),
  (UUID(),'ae300b95-7ad1-11e8-bb6d-1c1b0d291734','ADD','Tue','e78880a2-7567-11e8-bb6d-1c1b0d291734','596ff8b0-79fc-11e8-bfbf-2518e01aa7d2','2018-06-28','Pending'),
  (UUID(),'ae300b95-7ad1-11e8-bb6d-1c1b0d291734','ADD','Wed','e7888315-7567-11e8-bb6d-1c1b0d291734','596ff8b0-79fc-11e8-bfbf-2518e01aa7d2','2018-06-28','Pending');
  

SELECT ssar.status AS parentstatus, ssard.status AS detailstatus, ssar.*, ssar.`StudentID`, ssar.`Subject`, ssard.`DayOfWeek`, ssard.`SlotID`, ssar.`RequestStartDate`, 
	ssar.`RequestEndDate`, ssar.`IsPermanent`, ssard.`RequestType` 
FROM studentslotassignmentrequest ssar 
JOIN studentslotassignmentrequestdetail ssard ON ssar.`StudentSlotAssignmentRequestID` = ssard.`StudentSlotAssignmentRequestID`
WHERE ssar.status = 'pending' AND ssar.StudentSlotAssignmentRequestID =  'ae300b95-7ad1-11e8-bb6d-1c1b0d291734';	



	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WsConsumedReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `WsConsumedReport`(
     IN vStartDate     DATE,
     IN vEndDate     DATE,
     IN vSubject     DATE
    
    )
BEGIN

  SELECT S.`StudentID`,S.`FirstName`,S.`LastName`,S.`Gender`,S.`DOB`,S.`School`,
         S.`Grade`,SM.Description AS GradeDescription ,WS.TotalConsumed,
         WS.LS,WS.Level
 FROM `student` S 
   INNER JOIN (SELECT COUNT(WS.`Level`) AS TotalConsumed,WS.`Level`,  WS.`StudentID`, 
                      WS.`Subject`,WS.`WorksheetDate`,
                      (SELECT `WorksheetNum` FROM `worksheetscore` S2 
                       WHERE S2.status    = 'Active'    AND 
                             S2.StudentId = WS.StudentID AND
                             S2.Subject   = WS.`Subject` 
                       ORDER BY worksheetnum DESC LIMIT 1) AS LS
                FROM `worksheetscore` WS 
                where WS.WorksheetDate BETWEEN vStartDate AND vEndDate
                GROUP BY WS.StudentId, WS.Subject) WS ON WS.StudentId = S.`StudentID` 
    INNER JOIN `stringmap` SM ON SM.StringMapName = S.Grade 
  WHERE WS.Subject   = vSubject AND 
        S.Status     = 'Active' AND 
        WS.WorksheetDate BETWEEN vStartDate AND vEndDate;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-25 21:08:41
