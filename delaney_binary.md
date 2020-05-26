# Delaney Binary Classification

## Introduction

In 2004, John Delaney published a paper which studied a method to predict the aqueous solubility of various compounds [(Delaney, 2004)](https://pubs.acs.org/doi/10.1021/ci034243x) . This paper is widely cited in the machine learning and deep learning literature for chemistry applications. It is like a Titanic or MNIST dataset for the chemistry ML community. The data are labeled with the known solubility in log solubility in mol/L.

Starting the with the ESOL method described by Delaney in 2004, there have been multiple discussions of predicting solubility from these data. Here are two of them:

1.	[http://practicalcheminformatics.blogspot.com/2018/09/predicting-aqueous-solubility-its.html](http://practicalcheminformatics.blogspot.com/2018/09/predicting-aqueous-solubility-its.html)
1.	[https://github.com/deepchem/deepchem/blob/master/examples/tutorials/03_Modeling_Solubility.ipynb](https://github.com/deepchem/deepchem/blob/master/examples/tutorials/03_Modeling_Solubility.ipynb)

For this study, my interests are exploratory data analysis and comparing the performance of various models with these data. To simplify the first iteration of this process, I changed this from a regression of a continuous value of solubility into a binary classification. The two classes are:

1. Those compounds with solubility higher than the median solubility across the whole dataset
1. Those compounds with a solubility lower than the median solubility across the whole dataset.

## Methods

### Tools

I used the R language with the tidyverse, mlr, and keras libraries for analysis and Tableau software for exploratory data visualization.

### Data description

[FILL THIS IN]

### Data Preparation

For this test, I am not using the names of the compounds or the SMILES strings. The numeric features available are:

1.	Minimum degree
1.	Molecular weight
1.	Number of H Bond Donors
1.	Number of Rings
1.	Number of Rotatable Bonds
1.	Polar Surface Area


![Figure 1](img/rotatable_mw_all.png)
![Figure 2](img/rotatable_mw_below.png)
![Figure 3](img/rotatable_mw_above.png)
