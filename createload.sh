#!/bin/bash
sqlite3 main.db <./SQL/createTables.sql
sqlite3 main.db <./SQL/loadTables.sql