format() {
    python -m json.tool
}

n=2
echo "GET /lectures?limit=$n"
curl -s "localhost:8080/lectures?limit=$n" | format
echo ''

n=3
echo "GET /exams?limit=$n"
curl -s "localhost:8080/exams?limit=$n" | format

# curl -s "localhost:8080/lectures" | format | grep -C 4 -i 'big data'
# curl -s "localhost:8080/lecture/16291" | format
# curl -s "localhost:8080/lecture/16291/instructor" | format

psql -h localhost -p 25432 mercedtime mt -c '
SELECT
    l.crn,
    title,capacity,enrolled,remaining
FROM
    lectures l,
    enrollment e
WHERE
    l.crn = e.crn AND
    l.crn IN (10128,14526);'

curl -s "localhost:8080/lectures?subject=cse" | format

