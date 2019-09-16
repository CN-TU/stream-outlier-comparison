# stream-outlier-comparison
Comparison of algorithms for outlier detection in stream data. CN contact: Félix Iglesias

## About...
This repo contains the tools for replicating the experiments conducted in...

> *MDCstream: A MATLAB tool for Generating Stream Data*,
> by F.Iglesias, D.Odjanic, A.Hartl, and T.Zseby
 
Comments/issues: felix.iglesias(at)tuwien.ac.at 
CN Group - TU Wien, Sep 2019

## How to install
Download or clone the repository to a directory of your choice.

From the stream-outlier-comparison directory run the installMDC.sh script to download the dependencies needed.

## Reproduce experiments

**Creating datasets**

1. Open MATLAB
2. Include the folders containing MDCGen and MDCStream in the MATLAB path (with subfolders).
3. In the MATLAB environment, go to [mdcstream-wrapper]
4. To generate the used datasets, run: 
> experiments_Sep2019

Datasets are stored in [mdcstream-wrapper/dataRoot]


**Executing MOA stream out-det algorithms**

1. Go to [moa-wrapper]
2. From the terminal, execute:
> java -jar outlier-detector.jar config.xml
    
By default, results are stored in [mdcstream-wrapper/results] (take it easy, experiments take a good while, approx. one day depending on the machine). 
    
The previous command tests all algorithms together with all datasets. To obtain results and time performances separately, use instead:
> time java -jar outlier-detector.jar config&lt;derp>name].xml 

where [name] stands for the specific algorithm ("MCOD", "SimpleCOD", "AbstractC", "ExactStorm", and "AproxStorm")

**Calculating performances**

1. Go to [py_metrics]
2. From the terminal, execute: 
> python3 extract_performances.py

**Dependencies and final notes**

Experiments were developed and tested with MATLAB R2018a, Python 3.7.3, and Java SE 8. The MOA wrapper does not work with more recent versions of Java (9/10/11) due to issues with JAXB API classes. We are currently fixing this.

Results might be slightly different to the ones reported in the paper due to nondeterminism and lack of randomness control when running MOA algorithms.
