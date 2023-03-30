# GetDB and show DB data with 3 kinds of outputs on browser
from pymysql import *   
import streamlit as st    
import pandas as pd

# sidebar creation
st.sidebar.header('User Input Parameters')
table_name = st.sidebar.text_input('table name', '')
major= st.sidebar.text_input('major','')

try: 
    # create a connection to DB
    conn = connect(host='localhost',
                   port=3306,user='root',
                   password='',
                   database='ksu_database',
                   charset='utf8')
          
    # create cursor object
    cursor = conn.cursor()
        
    # send an SQL
    sql = 'SELECT * FROM %s where major= '%s' " % (table_name,major)
    count = cursor.execute(sql)
    result_all = cursor.fetchall()
    # the rows selected from the DB table
    print("The number of rows is: %d ", count)
    
    # for Web page
    st.title('Web output! ')
    st.text ('All of student data from ksu_database.student table is below:')
    #st.text ('* Show DB data using stream.write():')
    #html_string = "<h3 style=\"background-color:yellow\"> this is an html string</h3>"
    #st.markdown(html_string, unsafe_allow_html=True)
    st.header('*show DB data using DataFrame:')
    df=pd.DataFrame(result_all)
    styler = df.style.hide_index()
    st.write(styler.to_html(),unsafe_allow_html=True)
    # Show DB data using stream.write()
    #for row in result_all:
        #print   (row[0], "\t", row[1], "\t", 
      #           row[2], "\t", row[3], "\t", row[4] )  
      #  st.write(f"{row[0]}  {row[1]}  {row[2]}  {row[3]}  {row[4]}" ) 
    
    
    # close the used objects in Memory
    cursor.close()
    conn.close()
 
except:
    st.write('Waiting!')
  
 
