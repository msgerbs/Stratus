
// All terror spider code that relates to queen ruling over a hive

/mob/living/simple_animal/hostile/poison/terror_spider/proc/DoHiveSense()
	var/hsline = ""
	to_chat(src, "Your Brood: ")
	for(var/mob/living/simple_animal/hostile/poison/terror_spider/T in ts_spiderlist)
		if(T.spider_awaymission != spider_awaymission)
			continue
		hsline = "* [T] in [get_area(T)], "
		if(T.stat == DEAD)
			hsline += "DEAD"
		else
			hsline += "health [T.health] / [T.maxHealth], "
		if(T.ckey)
			hsline += " *Player Controlled* "
		else
			hsline += " AI "
		to_chat(src,hsline)

/mob/living/simple_animal/hostile/poison/terror_spider/proc/CountSpiders()
	var/numspiders = 0
	for(var/mob/living/simple_animal/hostile/poison/terror_spider/T in ts_spiderlist)
		if(T.stat != DEAD && !T.spider_placed && spider_awaymission == T.spider_awaymission)
			numspiders += 1
	return numspiders

/mob/living/simple_animal/hostile/poison/terror_spider/proc/CountSpidersType(specific_type)
	var/numspiders = 0
	for(var/mob/living/simple_animal/hostile/poison/terror_spider/T in ts_spiderlist)
		if(T.stat != DEAD && !T.spider_placed && spider_awaymission == T.spider_awaymission)
			if(T.type == specific_type)
				numspiders += 1
	for(var/obj/effect/spider/eggcluster/terror_eggcluster/E in ts_egg_list)
		if(E.spiderling_type == specific_type && E.z == z)
			numspiders += E.spiderling_number
	for(var/obj/effect/spider/spiderling/terror_spiderling/L in ts_spiderling_list)
		if(!L.stillborn && L.grow_as == specific_type && L.z == z)
			numspiders += 1
	return numspiders