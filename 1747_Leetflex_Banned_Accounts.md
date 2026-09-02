```sql
SELECT l1.account_id
FROM LogInfo l1
JOIN LogInfo l2
ON l1.account_id = l2.account_id
AND l1.ip_address != l2.ip_address
WHERE l1.login BETWEEN l2.login AND l2.logout;
```

**Since we are only focusing on th devices with different IPs having same account ID (condition of self join) and checking if the login time of first is between the work time of other (intersection).**
