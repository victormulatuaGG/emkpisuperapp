module SpreadsheetValuesResponse exposing (spreadsheetValuesResponse)


-- This is the response from the test spreadsheet, at https://sheets.googleapis.com/v4/spreadsheets/1Ai9H6Pfe1LPsOcksN6EF03-z-gO1CkNp8P1Im37N3TE/values/Regional%20Div%201?key=<thekey>
spreadsheetValuesResponse: String
spreadsheetValuesResponse =
  """{
    "range": "'Regional Div 1'!A1:Z1000",
    "majorDimension": "ROWS",
    "values": [
      [
        "Home Team",
        "Home Score",
        "Away Score",
        "Away Team",
        "Date Played",
        "Home Scorers",
        "Away Scorers",
        "Home Cards",
        "Away Cards",
        "Notes"
      ],
      [
        "Castle",
        "3",
        "0",
        "Meridian",
        "2018-06-04",
        "1, 1, 1"
      ]
    ]
  }"""