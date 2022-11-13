# Export coauthors
A bash script for exporting the coauthors of the given author from DBLP to help declare the conflicts of interest.

Authors are required to register all their conflicts when sumbtting a paper, including a conflict of interest with the people they have collaborated in writing a joint paper for the past several years. This script can export all coauthors of the papers published from the specified year.

## Usage

### Export coauthors

```
./export-coauthors.sh author_dblp_url start_year [file_name]
```


Arguments:
- `author_dblp_url`: The url of the author's dblp homepage.
- `start_year`: Export coauthors for papers published between this specified year and the current year (both included).
- `file_name` (optional): Export coauthors to this file.


For example, to export Prof. Kuo's coauthors from year 2020 (to now) and save the coauthors to `coauthors-kuo.txt` file:

```
./export-coauthors.sh https://dblp.org/pid/07/3181.html 2020 coauthors-kuo.txt
```

**Note:** This script exports coauthors for one author at a time. You may run this script for each author of your paper and get all coauthors. Put all coauthors in a file (e.g., `cat author1.txt author2.txt >> all-coauthors.txt`), and remove duplicate coauthors (e.g., `sort -u all-coauthors.txt`).


### List potential conflict people
Put all the program committee members and reviewers from the paper submission site in a text file, for example, `pc.txt`. Then use the following command to compare them with your coauthors and list all potential conflict people.

```
grep -o -f pc.txt all-coauthors.txt
```

