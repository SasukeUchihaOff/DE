import pandas as pd

excel_file = "tables.xlsx"
for sheet_name, df in pd.read_excel(excel_file, sheet_name=None).items():
    df.to_csv(f"{sheet_name}.csv", index=False, encoding="utf-8-sig")