import indices
import numpy as np
from numpy import genfromtxt
from scipy.spatial import distance

path2data = "../mdcstream-wrapper/results"
number_of_datasets = 20
algorithms = ['approxSTORM', 'exactSTORM', 'simpleCod', 'abstractC', 'mcod'] 
scenarios = ['sty-small-stc','seq-small-stc','nos-small-stc','sty-big-stc','seq-big-stc','nos-big-stc','sty-small-dyn','seq-small-dyn','nos-small-dyn','sty-big-dyn','seq-big-dyn','nos-big-dyn']
train_samples = 1000

resPatn = np.zeros(shape=(len(algorithms),(number_of_datasets)*len(scenarios)))
resap = np.zeros(shape=(len(algorithms),(number_of_datasets)*len(scenarios)))
resMF1 = np.zeros(shape=(len(algorithms),(number_of_datasets)*len(scenarios)))
resAuc = np.zeros(shape=(len(algorithms),(number_of_datasets)*len(scenarios)))

print (" sceID, scenario, algID, algorithm, datasetID: MF1_mu, MF1_sigma, Patn_mu, Patn_sigma, AP_mu, AP_sigma, ROC_mu, ROC_sigma") 
for k, scenario in enumerate(scenarios):
    for j, algorithm in enumerate(algorithms):
        for i in range(0, number_of_datasets):
            datasetname = path2data + "/outlierResult_" + algorithm + "_" + scenario + "_data_" + str(i+1) + ".txt"
            data_i = genfromtxt(datasetname, delimiter=',')
            rank = data_i[train_samples:,1].astype(float)
            data_i = data_i[train_samples:,:].astype(int)
            data_i[:,2] = (data_i[:,2] > 0).choose(data_i[:,2], 1) 
            pred = np.array(data_i[:,2], dtype=bool)
            label = np.array(data_i[:,3], dtype=bool)
            label = np.invert(label)
            pred = np.invert(pred)
            ki = i+k*number_of_datasets 
            res = indices.get_indices(label, rank)
            resPatn[j][ki] = res['Patn']
            resap[j][ki] = res['ap']
            resMF1[j][ki] = res['maxf1']
            resAuc[j][ki] = res['auc']
        print (" %d, %s, %d, %s, %d: %f, %f, %f, %f, %f, %f, %f, %f " % (k,scenario,j,algorithm,i, 
               round(np.nanmean(resMF1[j][ki-i:ki]),3),round(np.nanstd(resMF1[j][ki-i:ki]),3),
               round(np.nanmean(resPatn[j][ki-i:ki]),3),
               round(np.nanstd(resPatn[j][ki-i:ki]),3),
               round(np.nanmean(resap[j][ki-i:ki]),3),
               round(np.nanstd(resap[j][ki-i:ki]),3),
               round(np.nanmean(resAuc[j][ki-i:ki]),3),
               round(np.nanstd(resAuc[j][ki-i:ki]),3)))
