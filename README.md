# US baby names Power BI Dashboard
First of all this is the source of the data I used : https://www.kaggle.com/datasets/kaggle/us-baby-names
The dataset contains National data on the relative frequency of given names in the population of U.S. births where the individual has a Social Security Number 

- **NationalNames**  (1.83m rows)
   - Id
   - Name
   - Year
   - Gender
   - Count
- **StateNames** :  (5.65m rows) 
   - Id
   - Name
   - Year
   - Gender
   - State
   - Count

The data provides information from 1880 to 2014 (NationalNames) and from 1910 to 2014 (StateNames) but I decided to filter from 1920 to 2014 to have a coherent dashboard (all date with the same year's rank) 
and also a lighter dashboard.

To build this dashboard, I created from these two dataframes 5 tables :
- 2 tables with a calculated rank :
    - rank_by_year : View created from the NationalNames database, with a rank by year for each couple of name/gender, filtered from year >= 1920
    - rank_by_state : View created from the StateNames database, with a rank by year,state for each couple of name/gender,filtered from year >= 1920
- 3 Dimension tables :
   - dim_year : 
   - dim_name :  
