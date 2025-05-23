#define ENGI_AREAS list("Atmospherics", "Engineering", "Chief Engineer's Desk", "Engineering Control Room", "Tech Storage", "Зона Для Строительства")
#define SEC_AREAS list("Warden", "Security", "Detective", "Head of Security's Desk", "Prisoner Processing", "Internal Affairs Office", "Magistrate", "Зал Суда")
#define SERVICE_AREAS list("Bar", "Kitchen", "Chapel", "Библиотека", "Hydroponics", "Janitorial", "Arrival Shuttle", "Crew Quarters")
#define MED_AREAS list("Virology", "Chief Medical Officer's Desk", "Медицинский Отдел", "Psychiatrist", "Chemistry", "Paramedic", "Morgue")
#define COM_AREAS list("Blueshield", "NT Representative", "Head of Personnel's Desk", "Captain's Desk", "Bridge", "Офис Профессионального Тренера НТ")
#define SCI_AREAS list("Robotics", "Science", "Research Director's Desk", "Genetics", "Xenobiology")
#define SUPPLY_AREAS list("Cargo Bay", "Mining Dock", "Mining Outpost", "Quartermaster's Desk", "Mining", "Expedition", "Smith")
#define OTHER_AREAS list("Arrival Shuttle", "Crew Quarters", "Tool Storage", "EVA", "Labor Camp", "AI")

/datum/game_test/requests_console

/datum/game_test/requests_console/Run()
	all_department_names_in_set()

/datum/game_test/requests_console/proc/all_department_names_in_set()
	var/list/expected_departments = list()
	expected_departments |= ENGI_AREAS
	expected_departments |= SEC_AREAS
	expected_departments |= SERVICE_AREAS
	expected_departments |= MED_AREAS
	expected_departments |= COM_AREAS
	expected_departments |= SCI_AREAS
	expected_departments |= SUPPLY_AREAS
	expected_departments |= OTHER_AREAS

	var/list/fail_messages = list()
	for(var/obj/machinery/requests_console/console in GLOB.allRequestConsoles)
		if(!(console.department in expected_departments))
			var/message = "Requests console ([console.x]; [console.y]; [console.z]) has unknown department."
			message += "\nExpected: [jointext(expected_departments, ", ")]\nActual: [console.department]"
			fail_messages += message

	if(length(fail_messages))
		Fail(fail_messages.Join("\n"))

#undef ENGI_AREAS
#undef SEC_AREAS
#undef SERVICE_AREAS
#undef MED_AREAS
#undef COM_AREAS
#undef SCI_AREAS
#undef SUPPLY_AREAS
