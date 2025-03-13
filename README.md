
# Nginx Log Analyser

##  Project Overview  
The **Nginx Log Analyser** is a command-line tool that helps **analyze Nginx access logs**.
It extracts and displays:
•	**Top 5 IP addresses** making the most requests
•	**Top 5 most requested paths**
•	**Top 5 response status codes** 
•	**Top 5 user agents**
It also saves results to a **log file** for future reference.


## Features  
•	Reads and analyzes **Nginx log files**
•	Uses **`awk`**, **`sort`**, **`uniq`**, and **`head`** for processing
•	**Formatted output** for readability
•	**Saves results** to a timestamped log file
•	Works with **any Nginx log file**


## Installation & Usage  

### 1 Clone the Repository  

In bash:

git clone https://github.com/ibewilson/nginx-log-analyser.git
cd nginx-log-analyser

### 2. Make the Script Executable
chmod +x nginx-log-analyser.sh

### 3. Run the Script
./nginx-log-analyser.sh access.log

### 4. Sample Output
==============================                                                                                            Nginx Log Analysis Report                                                                                             ==============================                                                                                         Log File: access.log                                                                                                    Generated on: Thu Mar 13 01:58:23 EET 2025                                                                                                                                                                                                      -------------------------------------------------------------------------                                                                 Top 5 IP Addresses with Most Requests                                                                 -------------------------------------------------------------------------                                                178.128.94.113  1087 requests                                                                                           142.93.136.176  1087 requests                                                                                           138.68.248.85   1087 requests                                                                                           159.89.185.30   1086 requests                                                                                           86.134.118.70   277 requests                                                                                                                                                                                                                   -------------------------------------------------------------------------                                                                 Top 5 Most Requested Paths                                                                            -------------------------------------------------------------------------                                                /v1-health                     4560 requests                                                                            /                              270 requests                                                                             /v1-me                         232 requests                                                                             /v1-list-workspaces            127 requests                                                                             /v1-list-timezone-teams        75 requests                                                                                                                                                                                                     -------------------------------------------------------------------------                                                                 Top 5 Response Status Codes                                                                           -------------------------------------------------------------------------                                                200        5740 requests                                                                                                404        937 requests                                                                                                 304        621 requests                                                                                                 400        192 requests                                                                                                 "-"        31 requests                                                                                                                                                                                                                         -------------------------------------------------------------------------                                                                 Top 5 User Agents                                                                                     -------------------------------------------------------------------------                                                DigitalOcean                                       4347 requests                                                        Mozilla/5.0                                        513 requests                                                         Mozilla/5.0                                        332 requests                                                         Custom-AsyncHttpClient                             294 requests                                                         Mozilla/5.0                                        282 requests                                                                                                                                                                                     ===================================                                                                                       Analysis Completed Successfully                                                                                       ===================================   


## Automate with Cron Jobs

To schedule log analysis every hour, use a cron job:
1. Open the cron editor:

crontab -e

2. Add this line:

0 * * * * /path/to/nginx-log-analyser.sh /var/log/nginx/access.log
(Replace /path/to/nginx-log-analyser.sh with the actual script path.)

## Project Page

https://github.com/ibewilson/nginx-log-analyser

## Author

Ibewilson

## License

This project is open-source under the MIT License.

#### Roadmap: https://roadmap.sh/projects/nginx-log-analyser
