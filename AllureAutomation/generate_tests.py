"""
generate_tests.py
-----------------
Run this BEFORE robot every time you change the Excel file.
It reads SignUpRegisterData.xlsx and auto-generates Tests/RegistrationTestCase.robot.

Every Excel row  →  one separate Robot Framework test case  →  one entry in Allure.

HOW TO RUN:
    Step 1:  python generate_tests.py
    Step 2:  robot --listener allure_robotframework --outputdir Results Tests/RegistrationTestCase.robot
    Step 3:  allure serve Results

ADDING NEW TEST CASES:
    - Just add rows in Excel (new TC_006 etc.)
    - If it is a brand-new TC group, add one line in TC_DESCRIPTIONS below
    - Run python generate_tests.py  →  done, no other file needs touching
"""

import os
import openpyxl

# ── PATHS ─────────────────────────────────────────────────────────────────────
BASE_DIR     = os.path.dirname(os.path.abspath(__file__))
EXCEL_PATH   = os.path.join(BASE_DIR, "TestData", "SignUpRegisterData.xlsx")
OUTPUT_FILE  = os.path.join(BASE_DIR, "Tests",    "RegistrationTestCase.robot")

# These are written INSIDE the .robot file — Robot Framework resolves ${EXECDIR} at runtime
DATA_FILE_RF    = "${EXECDIR}/TestData/SignUpRegisterData.xlsx"
LOCATOR_FILE_RF = "${EXECDIR}/TestData/SignUpRegister_locators.xlsx"
# ─────────────────────────────────────────────────────────────────────────────

# ── TC DESCRIPTIONS ───────────────────────────────────────────────────────────
# Add a line here whenever you add a new TC group to Excel.
# "Valid" (without "Invalid") in the description → tagged "positive", else "negative"
TC_DESCRIPTIONS = {
    "TC_001": "Register User With Valid Data",
    "TC_002": "Register User With Invalid Name",
    "TC_003": "Register User With Invalid Email",
    "TC_004": "Register User With Invalid Password",
    "TC_005": "Register User With Missing Mandatory Fields",
}
# ─────────────────────────────────────────────────────────────────────────────


def get_tag(tc_id):
    desc = TC_DESCRIPTIONS.get(tc_id, "")
    return "positive" if ("Valid" in desc and "Invalid" not in desc) else "negative"


def read_rows(excel_path):
    """Return list of (tc_id, iteration, expected_result) from Excel."""
    wb = openpyxl.load_workbook(excel_path, read_only=True)
    ws = wb.active
    rows = []
    for row in ws.iter_rows(min_row=2, values_only=True):
        tc_id     = row[0]
        iteration = row[1]
        expected  = row[19] or ""
        if tc_id and iteration is not None:
            rows.append((
                str(tc_id).strip(),
                str(int(iteration)),
                str(expected)
            ))
    wb.close()
    return rows


def generate():
    rows = read_rows(EXCEL_PATH)

    lines = []

    # Settings
    lines += [
        "*** Settings ***",
        "Library     SeleniumLibrary",
        "Library     ${EXECDIR}/Resource/ExcelReader.py",
        "Library     allure_robotframework",
        "Resource    ${CURDIR}/../Resource/RegisterUserKeywords.robot",
        "",
    ]

    # Variables
    lines += [
        "*** Variables ***",
        "${URL}              https://automationexercise.com",
        "${BROWSER}          chrome",
        "${LOCATOR_FILE}     " + LOCATOR_FILE_RF,
        "${DATA_FILE}        " + DATA_FILE_RF,
        "",
    ]

    # Shared keyword — fetches the right row from Excel by index
    lines += [
        "*** Keywords ***",
        "",
        "Run Single Iteration",
        "    [Arguments]    ${tc_id}    ${iteration}",
        "    ${all_data}=    Get Test Data    ${DATA_FILE}    ${tc_id}",
        "    ${index}=       Evaluate    int(${iteration}) - 1",
        "    ${row}=         Set Variable    ${all_data}[${index}]",
        "    Run Registration Flow    ${row}    ${URL}    ${BROWSER}    ${LOCATOR_FILE}",
        "",
    ]

    # One test case per Excel row
    lines.append("*** Test Cases ***")
    lines.append("")

    for tc_id, iteration, expected in rows:
        desc    = TC_DESCRIPTIONS.get(tc_id, f"Test {tc_id}")
        tag     = get_tag(tc_id)
        tc_name = f"{tc_id} - {desc} - Iter {iteration}"

        lines += [
            tc_name,
            f"    [Tags]           {tag}    {tc_id}    iteration-{iteration}",
            f"    [Documentation]  {tc_id} | Iter {iteration} | Expected: {expected}",
            f"    Run Single Iteration    {tc_id}    {iteration}",
            "",
        ]

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f" Generated {len(rows)} test cases  →  {OUTPUT_FILE}")
    print()
    print("Next steps:")
    print("  robot --listener allure_robotframework --outputdir Results Tests/RegistrationTestCase.robot")
    print("  allure serve Results")


if __name__ == "__main__":
    generate()
