FROM debian:bullseye

# Set environment and working directory, then add files in repo
ENV FLU_DIR=/home/flu
WORKDIR ${FLU_DIR}
ADD . ${FLU_DIR}

# Run updates
RUN apt-get update -y
RUN apt-get install -y git r-base r-cran-ggplot2 curl unixodbc unixodbc-dev emacs python pip

# Install mssql odbc driver and tools
RUN bash mssql.sh
RUN rm mssql.sh

# Install requirements
RUN pip install -r requirements.txt

# Install pypfilt
# structured-array is the default branch
RUN pip install --no-cache-dir "git+https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python.git"

# Install epifx
# structured-array is the default branch
RUN pip install --no-cache-dir "git+https://gitlab.unimelb.edu.au/rgmoss/epidemic-forecasting-for-python"

