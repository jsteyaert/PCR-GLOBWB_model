#!/bin/bash

#SBATCH --output ./log/30sec_lc_meier_updated_pn.out
#SBATCH --error ./log/30sec_lc_meier_updated_pn.err
#SBATCH --time 240:00:00 
#SBATCH -n 32
#SBATCH -J 30pn




# the %10 submits them 10 at a time :)
echo "SBATCH job"
echo "Started $(date '+%d/%m/%Y %H:%M:%S')"
echo "Working directory $(pwd)"

module load 2021
module load Miniconda3/4.9.2

#export PCRASTER_NR_WORKER_THREADS=32

conda run -n pcr_model --no-capture-output python /eejit/home/steya001/climate_pcrglobwb/PCR-GLOBWB_model/model/deterministic_runner.py /eejit/home/steya001/climate_pcrglobwb/PCR-GLOBWB_model/config/30sec_jen/30sec_meier_updated_np.ini

#conda run -n pcr_model --no-capture-output python /eejit/home/steya001/climate_pcrglobwb/PCR-GLOBWB_model/model/deterministic_runner.py /eejit/home/steya001/climate_pcrglobwb/PCR-GLOBWB_model/config/30sec_jen/30sec_lc_meier.ini

echo "Finished $(date '+%d/%m/%Y %H:%M:%S')"


# H1
# potentially to have one job per GCM with things to edit and comment out
#START_DATE = 1990-01-01
#END_DATE = 2000-01-01
