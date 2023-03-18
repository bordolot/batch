@echo off
setlocal enabledelayedexpansion

set head=https://example.com/canvas/pdftohtml/2021_04_19_09_52_07-WebAppPenetrationTestReportExample-Proofed_pdf-000
set tail=.png

FOR /L %%A IN (1, 1, 12) DO (
  set number=%%A
    if !number! LSS 10 (
        set source=%head%00!number!%tail%
        curl !source! > !number!.png
    ) else (
        if !number! LSS 100 (
            set source=%head%0!number!%tail%
            curl !source! > !number!.png
        ) else (
            set source=%head%!number!%tail%
            curl !source! > !number!.png
        )
    )
)
