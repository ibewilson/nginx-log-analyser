#!/bin/bash

# Check if log file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: ./nginx-log-analyser.sh <log-file>"
    exit 1
fi

LOG_FILE="$1"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi


REPORT_FILE="log_analysis_$(date +"%Y%m%d_%H%M%S").txt"

{


echo " =============================="
echo "   Nginx Log Analysis Report"
echo " =============================="


echo "Log File: $LOG_FILE"

echo "Generated on: $(date)"


# Function to format output
print_section() {
    echo -e "\n-------------------------------------------------------------------------"
    echo -e "                  $1"
    echo -e "-------------------------------------------------------------------------"
}

# 1. Top 5 IP addresses making the most requests
print_section "Top 5 IP Addresses with Most Requests"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf " %-15s %s requests\n", $2, $1}'

# 2. Top 5 most requested paths
print_section "Top 5 Most Requested Paths"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf " %-30s %s requests\n", $2, $1}'

# 3. Top 5 response status codes
print_section "Top 5 Response Status Codes"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf " %-10s %s requests\n", $2, $1}'

# 4. Top 5 user agents
print_section "Top 5 User Agents"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf " %-50s %s requests\n", $2, $1}'

echo -e "\n     ==================================="
echo "       Analysis Completed Successfully"
echo "     ==================================="

} | tee "$REPORT_FILE"
