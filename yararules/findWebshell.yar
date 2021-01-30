rule findWebshell
{
    strings:
        $st1 = "NGFP1eqf9hiCIcKwHFj7ClIQh2Bd1V6bIthVZC1Jo4k2QSvzR2674raF"
		$st2 = "1Hbzs2w3S7YffAHTrZeabr3Y9DrhJ8v"
		$st3 = "eval (gzinflate(base64_decode"
		$st4 = "oxb*dugtril4_s09nm7ae#"
		$st5 = /(\$[0-9a-zA-Z]{4,6}\[[0-9]{1,2}\].){3}/ 	// match example: $qxbwt[3].$qbcge[52].$avwsq[44] 
    condition:
        any of them
}
