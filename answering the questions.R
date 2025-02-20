#Question 1: Read in the Minnesota tree growth dataset. Use glimpse to understand the structure and names of the dataset. Decribe the structure and what you see in the dataset?
  glimpse(tree_data.csv )
  #the structure of the data is...

#Question 2: How many records have been made in stand 1?
  #using this commadn summary(tree_data$standID ==1), I found that there are 979 records in stand 1 
  
#Question 3: How many records of the Abies balsamea and Pinus strobus species have been made?
  #using the command:
  > summary(tree_data$species[tree_data$species %in% c("ABBA", "PIST")])
  # I determined that there are 17221 records of the Abies balsamea and Pinus strobus species.

#Question 4: How many trees are older then 200 years old in the last year of the dataset?
  #using the following code I determined that 7 trees are older than 200 years old in the last year of the data set 
  > tree_data %>%
    +     filter(year == max(year), age > 200) %>%
    +     summarise(count = n())
  
#Question 5: What is the oldest tree in the dataset found using slice_max?
  #using the following code, I determined that the oldesst tree in the dataset is 269 years old 
  > tree_data %>%
    + slice_max(order_by = age, n=5)
  
#Question 6: Find the oldest 5 trees recorded in 2001. Use the help docs to understand optional parameters
  #Using the following code I found that the 5 oldest trees in 2001 were 263, 259, 212,206,and also 206 years old 
  > tree_data %>%
    + filter(year == 2001)%>%
    + slice_max(order_by = age, n = 5)
  #  <dbl>   <dbl> <chr> <dbl> <chr>   <dbl> <dbl>
    1     24       2 A2     2001 PIRE      263 0.21 
  2     25       2 A2     2001 PIRE      259 0.28 
  3   1595      24 F1     2001 FRNI      212 0.579
  4   1598      24 F1     2001 FRNI      206 0.394
  5   1712      26 F3     2001 FRNI      206 0.168
  
#Question 7: Using slice_sample, how many trees are in a 30% sample of those recorded in 2002?
    # using the following code I redermined that 687 trees are in  30% sample of those recoded in 2002. 
  
#Question 8: Filter all trees in stand 5 in 2007. Sort this subset by descending radius at breast height (rad_ib) and use slice_head() to get the top three trees. Report the tree IDs
  #using the following code I got that the top 3 trees in stand 5 recoreded in 2007, sorted by largest radius at breast height have the tree ID's of 128, 157, and 135
  >  tree_data %>%
    + filter(standID == 5, year == 2007) %>%
    + arrange(rad_ib) %>%
    + slice_head(n = 3) %>%
    + select(treeID)
  
#Question 9: Reduce your full data.frame to [treeID, stand, year, and radius at breast height]. Filter to only those in stand 3 with records from 2007, and use slice_min to pull the smallest three trees meaured that year.
 # using the following code I got that the 3 smallest trees are as follows 
  > smallest_tree_3_2007 <- tree_data %>%
    +     filter(standID == 3, year == 2007) %>%
    +     slice_min(order_by = rad_ib, n = 3) %>%
    +     select(treeID, stand, year, rad_ib)
#Question 10: Use select to remove the stand column. Use glimspe to show the dataset.
  smallest_tree_3_2007_nostand <- smallest_tree_3_2007 %>%
    + select(-stand)

 #Question 11: Look at the help document for dplyr::select and examine the “Overview of selection features”. Identify an option (there are multiple) that would help select all columns with the string “ID” in the name. Using glimpse to view the remaining dataset
  tree_data_IDs <- tree_data %>%
    +     select(contains("ID"))
  > glimpse(tree_data_IDs)
  
#Question 12: Find a selection pattern that captures all columns with either ‘ID’ or ‘stand’ in the name. Use glimpse to verify the selection.
> tree_data_ID_stand <- tree_data %>%
    + select(contains("ID"), contains("stand"))
> glimpse(tree_data_ID_stand)
  