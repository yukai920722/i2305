import streamlit as st

from st_aggrid import AgGrid

import pandas as pd

st.success("學生表格顯示如下")

df = pd.read_csv("students.csv")

AgGrid(df)