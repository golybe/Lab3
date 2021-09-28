-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Сен 21 2021 г., 23:55
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id12560014_schedule`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Class`
--

CREATE TABLE `Class` (
  `ClassID` int(11) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Classroom`
--

CREATE TABLE `Classroom` (
  `ClassRoomID` int(11) NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Building` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Department`
--

CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL,
  `Department` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Discipline`
--

CREATE TABLE `Discipline` (
  `DisciplineID` int(11) NOT NULL,
  `Discipline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Faculty`
--

CREATE TABLE `Faculty` (
  `FacultyID` int(11) NOT NULL,
  `Faculty` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `FormOfStudy`
--

CREATE TABLE `FormOfStudy` (
  `FormOfStudyID` int(11) NOT NULL,
  `FormOfStudy` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Group `
--

CREATE TABLE `Group ` (
  `GroupID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `FormOfStudyID` int(11) NOT NULL,
  `MajorID` int(11) NOT NULL,
  `NumberOfStudents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Lecturer`
--

CREATE TABLE `Lecturer` (
  `LecturerID` int(11) NOT NULL,
  `FirstName` text COLLATE utf8_unicode_ci NOT NULL,
  `LastName` text COLLATE utf8_unicode_ci NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `PositionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Major`
--

CREATE TABLE `Major` (
  `MajorID` int(11) NOT NULL,
  `Major` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Position`
--

CREATE TABLE `Position` (
  `PositionID` int(11) NOT NULL,
  `Position` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Schedule`
--

CREATE TABLE `Schedule` (
  `ScheduleID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `ClassRoomID` int(11) NOT NULL,
  `LecturerID` int(11) NOT NULL,
  `DisciplineID` int(11) NOT NULL,
  `WeekdayID` int(11) NOT NULL,
  `TypeOfLessonID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `TypeOfLesson`
--

CREATE TABLE `TypeOfLesson` (
  `TypeOfLessonID` int(11) NOT NULL,
  `TypeOfLesson` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Weekday`
--

CREATE TABLE `Weekday` (
  `WeekdayID` int(11) NOT NULL,
  `Weekday` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`ClassID`);

--
-- Индексы таблицы `Classroom`
--
ALTER TABLE `Classroom`
  ADD PRIMARY KEY (`ClassRoomID`);

--
-- Индексы таблицы `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Индексы таблицы `Discipline`
--
ALTER TABLE `Discipline`
  ADD PRIMARY KEY (`DisciplineID`);

--
-- Индексы таблицы `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`FacultyID`);

--
-- Индексы таблицы `FormOfStudy`
--
ALTER TABLE `FormOfStudy`
  ADD PRIMARY KEY (`FormOfStudyID`);

--
-- Индексы таблицы `Group `
--
ALTER TABLE `Group `
  ADD PRIMARY KEY (`GroupID`),
  ADD UNIQUE KEY `FacultyID` (`FacultyID`,`FormOfStudyID`,`MajorID`),
  ADD KEY `MajorID` (`MajorID`);

--
-- Индексы таблицы `Lecturer`
--
ALTER TABLE `Lecturer`
  ADD PRIMARY KEY (`LecturerID`),
  ADD UNIQUE KEY `DepartmentID` (`DepartmentID`,`PositionID`);

--
-- Индексы таблицы `Major`
--
ALTER TABLE `Major`
  ADD PRIMARY KEY (`MajorID`);

--
-- Индексы таблицы `Position`
--
ALTER TABLE `Position`
  ADD PRIMARY KEY (`PositionID`);

--
-- Индексы таблицы `Schedule`
--
ALTER TABLE `Schedule`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD UNIQUE KEY `GroupID` (`GroupID`,`ClassRoomID`,`LecturerID`,`DisciplineID`,`WeekdayID`,`TypeOfLessonID`,`ClassID`);

--
-- Индексы таблицы `TypeOfLesson`
--
ALTER TABLE `TypeOfLesson`
  ADD PRIMARY KEY (`TypeOfLessonID`);

--
-- Индексы таблицы `Weekday`
--
ALTER TABLE `Weekday`
  ADD PRIMARY KEY (`WeekdayID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Faculty`
--
ALTER TABLE `Faculty`
  MODIFY `FacultyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Group `
--
ALTER TABLE `Group `
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Group `
--
ALTER TABLE `Group `
  ADD CONSTRAINT `Group _ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `Faculty` (`FacultyID`),
  ADD CONSTRAINT `Group _ibfk_2` FOREIGN KEY (`MajorID`) REFERENCES `Major` (`MajorID`);

--
-- Ограничения внешнего ключа таблицы `Major`
--
ALTER TABLE `Major`
  ADD CONSTRAINT `Major_ibfk_1` FOREIGN KEY (`MajorID`) REFERENCES `Group ` (`MajorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
