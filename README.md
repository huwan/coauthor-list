# Coauthor lists for M Lab professors

Authors are required to register all their conflicts when sumbtting a paper, including a conflict of interest with the people they have collaborated in writing a joint paper for the past several years. This repo contains coauthor list based on the papers published for each professor in M Lab to help declare the conflicts of interest.

## Download

The duration for authors to disclose any conflicts may differ based on the conference, usually ranging from two to five years. Kindly download the relevant file that suits your requirements.

| Name | Last 1 year | Last 2 years | Last 3 years | Last 4 years | Last 5 years |
|------|---------------|---------------|---------------|---------------|---------------|
| Prof Guan | [Download](./Prof-Guan-last-1-year.txt) |[Download](./Prof-Guan-last-2-years.txt) |[Download](./Prof-Guan-last-3-years.txt) |[Download](./Prof-Guan-last-4-years.txt) |[Download](./Prof-Guan-last-5-years.txt) |
| Prof Kuo | [Download](./Prof-Kuo-last-1-year.txt) |[Download](./Prof-Kuo-last-2-years.txt) |[Download](./Prof-Kuo-last-3-years.txt) |[Download](./Prof-Kuo-last-4-years.txt) |[Download](./Prof-Kuo-last-5-years.txt) |
| Prof Xue | [Download](./Prof-Xue-last-1-year.txt) |[Download](./Prof-Xue-last-2-years.txt) |[Download](./Prof-Xue-last-3-years.txt) |[Download](./Prof-Xue-last-4-years.txt) |[Download](./Prof-Xue-last-5-years.txt) |

**Tips:**
1. Download the necessary files and compile all coauthors into a single file using the command `cat author1.txt author2.txt >> all-coauthors.txt`. Then, remove any duplicate coauthors by running the command `sort -u all-coauthors.txt`.
2. To obtain a list of individuals who may have conflicts of interest, compile all program committee members and paper reviewers from the submission site into a text file (e.g., `pc.txt`). Next, use the `grep -o -f pc.txt all-coauthors.txt` command to compare this list with your co-authors and generate a roster of potential conflict cases.

