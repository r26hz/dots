AWS 
alias IAM -> Dashboard

iftop
fitler

dst host xxxx 	src host xxxx
dst net xxxx 	src net net
dst port xxxx 	src port xxxx
dst portrange start-end 	src portrange start-end
gateway xxxx
ip proto protocol

## nmap

comon k8s port plus our own. can create file with these
 nmap -n -T4 -p 443,2379,6666,4194,6443,8443,8080,10250,10255,10256,9099,6782-6784,5052,8545,8551,18332,4444,3030,4040,6060,8000,6161,8008,5050,80,30000-32767,44134 10.12.32.0/19 -oG scan.txt

firewall detection
--badsum

spoof mac
--spoof-mac 

evade intrution system
fragments packet
-T2 -f

stealth
-sS 

--traceroute

targetlist
-iL targets.txt


--top-ports 10

check for sql inject
--script http-sql-injection