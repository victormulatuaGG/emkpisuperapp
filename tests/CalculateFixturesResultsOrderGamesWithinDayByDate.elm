module CalculateFixturesResultsOrderGamesWithinDayByDate exposing (..)

import Date exposing (..)
import Date.Extra exposing (..)
import Test exposing (..)
import Fuzz exposing (Fuzzer, intRange, list)
import Expect exposing (Expectation)

import Models.LeagueGames exposing (LeagueGames)
import Models.LeagueGamesForDay exposing (LeagueGamesForDay)
import Calculations.ResultsFixturesFromLeagueGames exposing (calculateResultsFixtures)
import ResultsFixturesHelpers exposing (..)


orderGamesByTime : Test
orderGamesByTime =
    fuzz (list dateTimeOnFebruaryFirst) "Games within a LeagueGamesForDay should be ordered by time" <|
        \(timesInDay) ->
            let
                games = List.map scheduledGame timesInDay
                sortedTimes = 
                    List.sortWith Date.Extra.compare timesInDay 
                    |> List.map Just
            in    
                calculateResultsFixtures (LeagueGames "Any League Title" games)
                |> expectFirstDay (expectGames sortedTimes)
                    
expectGames: List (Maybe Date) -> Maybe LeagueGamesForDay -> Expectation
expectGames expectedTimes leagueGamesForDay =
    Expect.equalLists 
        expectedTimes 
        (Maybe.map .games leagueGamesForDay 
        |> Maybe.withDefault []
        |> List.map .datePlayed)

dateTimeOnFebruaryFirst : Fuzzer Date
dateTimeOnFebruaryFirst =
    Fuzz.map 
        (\hours -> 
            Date.Extra.fromCalendarDate 2001 Feb 1
            |> Date.Extra.add Hour hours
        )
        (intRange 0 23)
    
