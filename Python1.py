import pandas as pd
# Reading the data from each country's tab into separate dataframes
country1_df = pd.read_csv('/content/drive/MyDrive/Git files/Country 1.csv', encoding='latin1')
country2_df = pd.read_csv('/content/drive/MyDrive/Git files/Country 2.csv', encoding='latin1')
country3_df = pd.read_csv('/content/drive/MyDrive/Git files/Country 3.csv', encoding='latin1')
country4_df = pd.read_csv('/content/drive/MyDrive/Git files/Country 4.csv', encoding='latin1')


# Concatenating all country dataframes into a single dataframe
all_countries_df = pd.concat([country1_df, country2_df, country3_df, country4_df])


# Grouping the data by knowledge title and calculate the number of chats triggered and total sessions
knowledge_stats = all_countries_df.groupby('Knowledge Name').agg({'Chat ID': 'nunique', 'Session ID': 'nunique'}).reset_index()
knowledge_stats.columns = ['Knowledge Name', 'Chats Triggered', 'Total Sessions']


# Sorting the dataframe by the number of chats triggered in descending order
knowledge_stats = knowledge_stats.sort_values('Chats Triggered', ascending=False)


# Selecting the top 10 knowledge titles
top_10_knowledge = knowledge_stats.head(10)




# Calculating the resolution rate and switch to the live agent rate for each knowledge title
top_10_knowledge['Resolution Rate'] = top_10_knowledge['Total Sessions'] / top_10_knowledge['Chats Triggered']
top_10_knowledge['Switch to Live Agent Rate'] = top_10_knowledge['Total Sessions'] / top_10_knowledge['Chats Triggered']


top_10_knowledge.head(10)




import matplotlib.pyplot as plt


# Ploting the top 10 knowledge titles based on the number of chats triggered
plt.figure(figsize=(10, 6))
plt.bar(top_10_knowledge['Knowledge Name'], top_10_knowledge['Chats Triggered'])
plt.xlabel('Knowledge Title')
plt.ylabel('Number of Chats Triggered')
plt.title('Top 10 Knowledge Titles by Chats Triggered')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# Plotuing the resolution rate and switch to live agent rate for each knowledge title
plt.figure(figsize=(10, 6))
plt.plot(top_10_knowledge['Knowledge Name'], top_10_knowledge['Resolution Rate'], marker='o', label='Resolution Rate')
plt.plot(top_10_knowledge['Knowledge Name'], top_10_knowledge['Switch to Live Agent Rate'], marker='o', label='Switch to Live Agent Rate')
plt.xlabel('Knowledge Title')
plt.ylabel('Rate')
plt.title('Resolution Rate and Switch to Live Agent Rate for Top 10 Knowledge Titles')
plt.xticks(rotation=45)
plt.legend()
plt.tight_layout()
plt.show()
