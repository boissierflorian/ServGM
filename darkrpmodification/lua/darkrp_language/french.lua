--[[-----------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------

This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
    darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
    -- Admin things
    need_admin = "Vous devez disposer des privilèges administrateurs pour %s",
    need_sadmin = "Vous devez disposer des privilèges super-administrateurs pour %s",
    no_privilege = "Vous ne disposer pas des privilèges requis pour effectuer cette action",
    no_jail_pos = "Aucune cellule n'a été mise en place !",
    invalid_x = "Invalid %s! %s",

    -- F1 menu
    f1ChatCommandTitle = "Commandes du chat",
    f1Search = "Cherche...",

    -- Money things:
    price = "Prix: %s%d",
    priceTag = "Prix: %s",
    reset_money = "%s has reset all players' money!",
    has_given = "%s vous a donné %s",
    you_gave = "Vous avez donné %s %s",
    npc_killpay = "%s pour avoir tué un PNJ !",
    profit = "profit",
    loss = "pertes",
    Donate = "Faire un don",
    you_donated = "Vous avez donné %s à %s!",
    has_donated = "%s vous a donné %s!",    

    -- backwards compatibility
    deducted_x = "Déduit %s%d",
    need_x = "Besoin de %s%d",

    deducted_money = "Déduit %s",
    need_money = "Besoin de %s",

    payday_message = "Jour de paie ! Vous avez reçu %s!",
    payday_unemployed = "Vous n'avez pas reçu de salaire car vous êtes au chômage !",
    payday_missed = "Jour de paie annulé! (Vous êtes en prison)",

    property_tax = "Taxe d'habitation ! %s",
    property_tax_cant_afford = "Vous n'avez pas les moyens de payer la taxe ! Votre propriété vous a été retirée !",
    taxday = "Jour de taxe! %s%% de vos revenus vous ont été octroyés!",

    found_cheque = "Vous avez récupéré %s%s d'un chèque provenant de %s.",
    cheque_details = "Ce chèque est destiné à %s.",
    cheque_torn = "Vous avez détruit le chèque.",
    cheque_pay = "Destinataire: %s",
    signed = "Signé: %s",

    found_cash = "Vous avez trouvé %s%d!", -- backwards compatibility
    found_money = "Vous avez trouvé %s!",

    owner_poor = "le %s propriétaire est trop pauvre pour subventionner cette vente !",

    -- Police
    Wanted_text = "Recherché !",
    wanted = "Recherché par la police !\nRaison: %s",
    youre_arrested = "Vous avez été arrêté. Durée de l'emprisonnement: %d secondes!",
    youre_arrested_by = "Vous avez été arrêté par %s.",
    youre_unarrested_by = "Vous avez été libéré par %s.",
    hes_arrested = "%s a été arrêté pour %d secondes!",
    hes_unarrested = "%s est sorti de prison !",
    warrant_ordered = "%s à ordonné un avis de recherche pour %s. Raison: %s",
    warrant_request = "%s demande un avis de recherche pour %s\nRaison: %s",
    warrant_request2 = "La demande d'avis de recherche a été envoyée au maire %s !",
    warrant_approved = "L'avis de recherche a été agrée pour %s!\nRaison: %s\nOrdonné par: %s",
    warrant_approved2 = "La fouille du domicile est maintenant autorisée.",
    warrant_denied = "Le maire %s a refusé votre demande d'avis de recherche.",
    warrant_expired = "L'avis de recherche pour %s est terminé !",
    warrant_required = "Vous devez disposer d'un mandat pour ouvrir cette porte.",
    warrant_required_unfreeze = "Vous devez disposer d'un mandat pour dé-freeze le prop.",
    warrant_required_unweld = "Vous devez disposer d'un mandat pour délier ce prop.",
    wanted_by_police = "%s est recherché par la police !\nRaison: %s\nOrdonné par: %s",
    wanted_by_police_print = "%s a posé un avis de recherche sur %s, raison: %s",
    wanted_expired = "%s n'est plus recherché par la police.",
    wanted_revoked = "%s n'est plus recherché par la police.\nRevoqué par: %s",
    cant_arrest_other_cp = "Vous ne pouvez pas arrêter vos collègues !",
    must_be_wanted_for_arrest = "Le joueur doit être recherché pour pouvoir l'emprisonner",
    cant_arrest_fadmin_jailed = "Vous ne pouvez pas emprisonner un joueur enfermé par un admin.",
    cant_arrest_no_jail_pos = "Vous ne pouvez pas arrêter des personnes car les cellules sont inexistantes !",
    cant_arrest_spawning_players = "Vous ne pouvez pas arrêter les nouveaux joueurs.",

    suspect_doesnt_exist = "Suspect inexistant.",
    actor_doesnt_exist = "Demandeur inexistant.",
    get_a_warrant = "obtenir un mandat",
    remove_a_warrant = "supprimer un mandat",
    make_someone_wanted = "demander un avis de recherche",
    remove_wanted_status = "supprimer l'avis de recherche",
    already_a_warrant = "Cet individu fait déjà l'office d'un mandat.",
    not_warranted = "Cet individu ne fait pas l'office d'un mandat pour l'instant.",
    already_wanted = "Cet individu est déjà recherché par les forces de l'ordre.",
    not_wanted = "Cet individu n'est pas recherché.",
    need_to_be_cp = "Vous devez être un membre des forces de l'odre.",
    suspect_must_be_alive_to_do_x = "Le suspect doit être vivant pour %s.",
    suspect_already_arrested = "Le suspect est déjà emprisonné.",

    -- Players
    health = "Vie: %s",
    job = "Travail: %s",
    salary = "Salaire: %s%s",
    wallet = "Porte-feuille: %s%s",
    weapon = "Arme: %s",
    kills = "Meurtres: %s",
    deaths = "Morts: %s",
    rpname_changed = "%s a changé de nom",
    disconnected_player = "joueur déconnecté",
	player = "un joueur",

    -- Teams
    need_to_be_before = "Vous devez être %s pour devenir %s",
    need_to_make_vote = "Un vote est nécessaire pour devenir un(e) %s!",
    team_limit_reached = "Impossible de devenir %s la limite a été atteinte",
    wants_to_be = "%s\nsouhaite devenir \n%s",
    has_not_been_made_team = "%s n'est pas pu changer de métier !",
    job_has_become = "%s a changé de métier !",

    -- Disasters
    meteor_approaching = "WARNING: Meteor storm approaching!",
    meteor_passing = "Meteor storm passing.",
    meteor_enabled = "Meteor Storms are now enabled.",
    meteor_disabled = "Meteor Storms are now disabled.",
    earthquake_report = "Earthquake reported of magnitude %sMw",
    earthtremor_report = "Earth tremor reported of magnitude %sMw",

    -- Keys, vehicles and doors
    keys_allowed_to_coown = "Vous êtes autorisé à posséder cette entité\n(Appuyer sur RECHARGER avec les clés ou sur F2)\n",
    keys_other_allowed = "Co-propriétaires:",
    keys_allow_ownership = "(Appuyer sur RECHARGER avec les clés ou sur F2 pour autoriser la possesion)",
    keys_disallow_ownership = "(Appuyer sur RECHARGER avec les clés ou sur F2 pour désactiver la possesion)",
    keys_owned_by = "Possédé par:",
    keys_unowned = "Sans propriétaire\n(Appuyer sur RECHARGER avec les clés ou sur F2 pour en prendre possesion)",
    keys_everyone = "(Appuyer sur RECHARGER avec les clés ou sur F2 pour ajouter tout le monde)",
    door_unown_arrested = "Vos droits de possessions vous sont retirés lorsque vous êtes arrêté!",
    door_unownable = "Cette porte ne peut être achetée !",
    door_sold = "Vous avez vendu ceci pour %s",
    door_already_owned = "Cette porte est déjà prise par quelqu'un d'autre !",
    door_cannot_afford = "Vous ne pouvez acheter cette porte !",
    door_hobo_unable = "Vous ne pouvez pas acheter cette porte en étant SDF ! LOL !?",
    vehicle_cannot_afford = "Vous ne pouvez acheter ce véhicule",
    door_bought = "Vous avez acheté cette porte pour %s%s",
    vehicle_bought = "Vous avez acheté ce véhicule pour %s%s",
    door_need_to_own = "Vous devez être propriétaire de cette porte pour %s",
    door_rem_owners_unownable = "Vous ne pouvez supprimer des co-propriétaires si cette porte n'est pas achetable !",
    door_add_owners_unownable = "Vous ne pouvez ajouter des propriétaires si cette porte n'est pas achetable !",
    rp_addowner_already_owns_door = "%s est déjà propriétaire de cette porte !",
    add_owner = "Ajouter un propriétaire",
    remove_owner = "Supprimer un propriétaire",
    coown_x = "Co-own %s",
    allow_ownership = "Activer la possession",
    disallow_ownership = "Désactiver la possession",
    edit_door_group = "Modifier le groupe de la porte",
    door_groups = "Les groupes de la porte",
    door_group_doesnt_exist = "Le groupe est inexistant !",
    door_group_set = "Le groupe de la porte a été mis à jour.",
    sold_x_doors_for_y = "Vous avez vendu %d portes pour %s%d!", -- backwards compatibility
    sold_x_doors = "Vous avez vendu %d portes pour %s!",

    -- Entities
    drugs = "drgogues",
    Drugs = "Drogues",
    drug_lab = "Labo de drogues",
    gun_lab = "Gun Lab",
    any_lab = "any lab",
    gun = "gun",
    microwave = "Micro-ondes",
    food = "nourriture",
    Food = "Nourriture",
    money_printer = "Imprimante d'argent",
    tip_jar = "Boîte à dons",

    sign_this_letter = "Signer cette lettre",
    signed_yours = "Votre,",

    money_printer_exploded = "Votre imprimante d'argent à explosé !",
    money_printer_overheating = "Votre imprimante d'argent est en surchauffe",

    contents = "Contenu: ",
    amount = "Quantité: ",

    picking_lock = "Picking lock",

    cannot_pocket_x = "Vous ne pouvez mettre ceci dans votre poche !",
    object_too_heavy = "Cet objet est trop lourd.",
    pocket_full = "Votre poche est pleine !",
    pocket_no_items = "Votre poche est vide.",
    drop_item = "Jetter un objet",

    bonus_destroying_entity = "en détruisant cet objet illégal.",

    switched_burst = "Bascule en mode burst-fire.",
    switched_fully_auto = "Bascule en mode de feu automatique.",
    switched_semi_auto = "Bascule en mode de feu semi-automatique.",

    keypad_checker_shoot_keypad = "Tirez sur un keypad pour voir ce qu'il contrôle.",
    keypad_checker_shoot_entity = "Tirez sur un objet pour voir quels keypads sont connectés à celui-ci",
    keypad_checker_click_to_clear = "Clic-droit pour supprimer.",
    keypad_checker_entering_right_pass = "Inscription du bon mot de passe",
    keypad_checker_entering_wrong_pass = "Inscription du mauvais mot de passe",
    keypad_checker_after_right_pass = "après avoir entré le bon mot de passe",
    keypad_checker_after_wrong_pass = "après avoir entré le mauvais mot de passe",
    keypad_checker_right_pass_entered = "Le bon mot de passe a été tapé",
    keypad_checker_wrong_pass_entered = "Le mauvais mot de passe a été tapé",
    keypad_checker_controls_x_entities = "Ce keypad contrôle %d objet(s)",
    keypad_checker_controlled_by_x_keypads = "Cet objet est controlé par %d keypad(s)",
    keypad_on = "ON",
    keypad_off = "OFF",
    seconds = "secondes",

    persons_weapons = "Les armes illégales de %s : ",
    returned_persons_weapons = "Les armes confisquées de %s lui ont été rendu",
    no_weapons_confiscated = "%s ne s'est pas fait confisqué des armes !",
    no_illegal_weapons = "%s est en règle.",
    confiscated_these_weapons = "Armes confisquées :",
    checking_weapons = "Vérification des armes",

    shipment_antispam_wait = "Veuillez patientez avant de faire apparaître une autre boîte.",
    shipment_cannot_split = "Impossible de diviser cette boîte.",

    -- Talking
    hear_noone = "Personne ne peut vous entendre %s!",
    hear_everyone = "Tout le monde peut vous entendre !",
    hear_certain_persons = "Les joueurs qui vous entendent %s: ",

    whisper = "chuchoter",
    yell = "crier",
    broadcast = "[Broadcast!]",
    radio = "radio",
    request = "(REQUÊTE!)",
    group = "(groupe)",
    demote = "(RÉTROGRADATION)",
    ooc = "HRP",
    radio_x = "Radio %d",

    talk = "parler",
    speak = "discuter",

    speak_in_ooc = "parler en HRP",
    perform_your_action = "accomplir une action",
    talk_to_your_group = "parler à son groupe",

    channel_set_to_x = "Canal positionné sur la fréquence %s!",

    -- Notifies
    disabled = "%s a été désactivé! %s",
    gm_spawnvehicle = "Le spawn de véhicules",
    gm_spawnsent = "Le spawn d'entités scriptées",
    gm_spawnnpc = "Le spawn de PNJ",
    see_settings = "Veuillez consulter les paramètres DarkRP.",
    limit = "Vous avez atteint la limite des %s !",
    have_to_wait = "Vous devez attendre %d secondes avant de pouvoir utiliser %s!",
    must_be_looking_at = "Vous devez regarder %s!",
    incorrect_job = "Vous n'avez pas le métier requis pour %s",
    unavailable = "%s n'est pas disponible",
    unable = "Vous êtes dans l'incapacité de %s. %s",
    cant_afford = "Vous ne pouvez vous permettre d'acheter %s",
    created_x = "%s a créé %s",
    cleaned_up = "Vos %s ont été supprimées.",
    you_bought_x = "Vous avez acheté %s pour %s%d.", -- backwards compatibility
    you_bought = "Vous avez acheté %s pour %s.",
    you_got_yourself = "Vous avez récupéré %s.",    
    you_received_x = "Vous avez reçu %s pour %s.",

    created_first_jailpos = "Vous avez placé la première cellule !",
    added_jailpos = "Vous avez ajouté une cellule supplémentaire !",
    reset_add_jailpos = "Vous avez supprimé toutes les cellules existantes et vous en avez ajouté une ici.",
    created_spawnpos = "Le spawn %s a été créé.",
    updated_spawnpos = "Le spawn %s's a été mis à jour.",
    do_not_own_ent = "Vous ne possèdez pas cette entité !",
    cannot_drop_weapon = "Impossible de lâcher cette arme !",
    job_switch = "Les métiers ont été échangés !",
    job_switch_question = "Échanger de métier avec %s ?",
    job_switch_requested = "Demande d'échange de métier envoyée.",

    cooks_only = "Réservé aux cuisiniers.",

    -- Misc
    unknown = "Inconnu",
    arguments = "Arguments",
    no_one = "personne",
    door = "porte",
    vehicle = "véhicule",
    door_or_vehicle = "porte/véhicule",
    driver = "Conducteur: %s",
    name = "Nom: %s",
    locked = "Vérouillé.",
    unlocked = "Ouvert.",
    player_doesnt_exist = "Joueur inexistant.",
    job_doesnt_exist = "Métier inexistant !",
    must_be_alive_to_do_x = "Vous devez être en vie pour %s.",
    banned_or_demoted = "Banni/rétrogradé",
    wait_with_that = "Attendez avec ceci.",
    could_not_find = "Impossible de trouver %s",
    f3tovote = "Appuyez sur F3 pour voter",
    listen_up = "Écoutez:", -- In rp_tell or rp_tellall
    nlr = "New Life Rule: Ne pas se venger après s'être fait tué.",
    reset_settings = "Vous avez ré-initialisé tous les paramètres !",
    must_be_x = "Vous devez être %s pour %s.",
    agenda_updated = "L'agenda a été mis à jour",
    job_set = "%s a défini son nouveau métier '%s'",
    demoted = "%s a été rétrogradé",
    demoted_not = "%s n'a pas été rétrogradé",
    demote_vote_started = "%s a commencé un vote pour la rétrogradation de %s",
    demote_vote_text = "Raison de le rétrogradation:\n%s", -- '%s' is the reason here
    cant_demote_self = "Vous ne pouvez vous rétrograder vous même.",
    i_want_to_demote_you = "Je veux vous rétrograder. Raison: %s",
    tried_to_avoid_demotion = "Vous avez tenté d'échapper à la rétrogradation. Vous avez échoué et vous avez été rétrogradé.", -- naughty boy!
    lockdown_started = "Le maire a déclaré l'état d'urgence, veuillez rentrer chez vous !",
    lockdown_ended = "L'état d'urgence est terminé",
    gunlicense_requested = "%s a demandé à %s une licence d'armes",
    gunlicense_granted = "%s a remis une licence d'armes à %s",
    gunlicense_denied = "%s a refusé de remettre une licence d'armes à %s",
    gunlicense_question_text = "Remettre une licence d'armes à %s ?",
    gunlicense_remove_vote_text = "%s a initié un vote pour la suppression de la licence d'armes de %s",
    gunlicense_remove_vote_text2 = "Revoquer la licence d'armes :\n%s", -- Where %s is the reason
    gunlicense_removed = "La licence d'armes de %s lui a été retirée !",
    gunlicense_not_removed = "La licence d'armes de %s ne lui pas été retirée !",
    vote_specify_reason = "Vous devez spécifier une raison !",
    vote_started = "Le vote a été créé",
    vote_alone = "Vous avez remporté le vote puisque vous l'êtes l'unique joueur sur le serveur.",
    you_cannot_vote = "Vous ne pouvez voter !",
    x_cancelled_vote = "%s a annulé le dernier vote.",
    cant_cancel_vote = "Impossible d'annuler le dernier vote puisqu'il y en avait pas !",
    jail_punishment = "La sentence pour s'être déconnecté ! Emprisonné pour : %d secondes.",
    admin_only = "Réservé aux admins!", -- When doing /addjailpos
    chief_or = "Chef ou ",-- When doing /addjailpos
    frozen = "Immobilisé.",

    dead_in_jail = "Vous êtes déclaré décédé jusqu'à ce que vous soyez libéré !",
    died_in_jail = "%s est mort en prison !",

    credits_for = "CREDITS POUR %s\n",
    credits_see_console = "DarkRP credits sont affichés dans la console.",

    rp_getvehicles = "Véhicules disponibles à la customization :",

    data_not_loaded_one = "Vos données n'ont pas encore été chargées. Veuillez patienter.",
    data_not_loaded_two = "Si cela persiste, essayez de déco-reco ou de contacter un admin.",

    cant_spawn_weapons = "Vous ne pouvez faire apparaître des armes.",
    drive_disabled = "La conduite est désactivée pour le moment.",
    property_disabled = "Les propriétés sont désactivées pour le moment.",

    not_allowed_to_purchase = "Vous n'êtes pas autorisé à acheter cet objet.",

    rp_teamban_hint = "rp_teamban [pseudo/ID] [métier/id]. Pour bannir un joueur d'un métier spécifique.",
    rp_teamunban_hint = "rp_teamunban [pseudo/ID] [métier/id]. Pour débannir un joueur d'un métier spécifique.",
    x_teambanned_y = "%s a banni %s pour le métier %s.",
    x_teamunbanned_y = "%s a unban %s pour le métier %s.",

    -- Backwards compatibility:
    you_set_x_salary_to_y = "Vous avez fixé le salaire de %s à %s%d.",
    x_set_your_salary_to_y = "%s a fixé votre salaire à %s%d.",
    you_set_x_money_to_y = "Vous avez fixé le porte-feuille de %s à %s%d.",
    x_set_your_money_to_y = "%s a fixé votre porte-feuille à %s%d.",

    you_set_x_salary = "Vous avez fixé le salaire de %s à %s.",
    x_set_your_salary = "%s a fixé votre salaire à %s.",
    you_set_x_money = "Vous avez fixé le porte-feuille de %s à %s.",
    x_set_your_money = "%s a fixé votre porte-feuille à %s.",
    you_set_x_name = "Vous avez défini le nom de %s en %s",
    x_set_your_name = "%s a défini votre nom : %s",

    someone_stole_steam_name = "Quelqu'un utilise déjà votre pseudo steam en nom RP, donc un '1' sera ajouté après votre nom.", -- Uh oh
    already_taken = "Déjà pris.",

    job_doesnt_require_vote_currently = "Ce job ne nécessite pas de vote pour le moment !",

    x_made_you_a_y = "%s vous a rendu %s!",

    cmd_cant_be_run_server_console = "Cette commande ne peut être exécutée depuis la console du serveur.",

    -- The lottery
    lottery_started = "Il y a une loterie ! Participer pour %s%d?", -- backwards compatibility
    lottery_has_started = "Il y a une loterie ! Participer pour %s?",
    lottery_entered = "Vous participez à la loterie pour %s",
    lottery_not_entered = "%s ne participe pas à la loterie",
    lottery_noone_entered = "Personne ne participe à la loterie",
    lottery_won = "%s a gagné la loterie ! Il a gagné %s",

    -- Animations
    custom_animation = "Custom animation!",
    bow = "Bow",
    sexy_dance = "Sexy dance",
    follow_me = "Follow me!",
    laugh = "Laugh",
    lion_pose = "Lion pose",
    nonverbal_no = "Non-verbal no",
    thumbs_up = "Thumbs up",
    wave = "Wave",
    dance = "Dance",    

    -- Hungermod
    starving = "Starving!",

    -- AFK
    afk_mode = "Mode AFK",
    salary_frozen = "Votre salaire a été gêlé.",
    salary_restored = "Heureux de vous revoir, votre salaire a été restauré.",
    no_auto_demote = "Vous ne serez pas automatiquement rétrogradé.",
    youre_afk_demoted = "Vous avez été rétrogradé pour avoir été trop longtemps AFK. La prochaine fois, utilisez /afk.",
    hes_afk_demoted = "%s a été rétrogradé pour avoir été AFK trop longtemps.",
    afk_cmd_to_exit = "Écrivez /afk encore une fois pour quitter le mode AFK.",
    player_now_afk = "%s est maintenant AFK.",
    player_no_longer_afk = "%s n'est plus AFK.",

    -- Hitmenu
    hit = "hit",
    hitman = "Hitman",
    current_hit = "Hit: %s",
    cannot_request_hit = "Cannot request hit! %s",
    hitmenu_request = "Request",
    player_not_hitman = "This player is not a hitman!",
    distance_too_big = "Distance too big.",
    hitman_no_suicide = "The hitman won't kill himself.",
    hitman_no_self_order = "A hitman cannot order a hit for himself.",
    hitman_already_has_hit = "The hitman already has a hit ongoing.",
    price_too_low = "Price too low!",
    hit_target_recently_killed_by_hit = "The target was recently killed by a hit,",
    customer_recently_bought_hit = "The customer has recently requested a hit.",
    accept_hit_question = "Accept hit from %s\nregarding %s for %s%d?", -- backwards compatibility
    accept_hit_request = "Accept hit from %s\nregarding %s for %s?",
    hit_requested = "Hit requested!",
    hit_aborted = "Hit aborted! %s",
    hit_accepted = "Hit accepted!",
    hit_declined = "The hitman declined the hit!",
    hitman_left_server = "The hitman has left the server!",
    customer_left_server = "The customer has left the server!",
    target_left_server = "The target has left the server!",
    hit_price_set_to_x = "Hit price set to %s%d.", -- backwards compatibility
    hit_price_set = "Hit price set to %s.",
    hit_complete = "Hit by %s complete!",
    hitman_died = "The hitman died!",
    target_died = "The target has died!",
    hitman_arrested = "The hitman was arrested!",
    hitman_changed_team = "The hitman changed team!",
    x_had_hit_ordered_by_y = "%s had an active hit ordered by %s",

    -- Vote Restrictions
    hobos_no_rights = "Les SDF ne peuvent voter !",
    gangsters_cant_vote_for_government = "Les Gangsters ne peuvent prendre part aux affaires du gouvernement !",
    government_cant_vote_for_gangsters = "Le gouvernement ne peut prendre part aux affaires des gangsters !",

    -- VGUI and some more doors/vehicles
    vote = "Vote",
    time = "Temps: %d",
    yes = "Oui",
    no = "Non",
    ok = "Okay",
    cancel = "Annuler",
    add = "Ajouter",
    remove = "Supprimer",
    none = "Aucun",

    x_options = "%s options",
    sell_x = "Vendre %s",
    set_x_title = "Définir le titre de %s",
    set_x_title_long = "Définir le titre de %s, actuellement regardé(e).",
    jobs = "Métiers",
    buy_x = "Acheter %s",

    -- F4menu
    ammo = "munitions",
    weapon_ = "arme",
    no_extra_weapons = "Ce métier ne fournit pas des armes supplémentaires.",
    become_job = "Postuler",
    create_vote_for_job = "Créer un vote",
    shipment = "cargaisons",
    Shipments = "Cargaisons",
    shipments = "cargaisons",
    F4guns = "Armes",
    F4entities = "Autres",
    F4ammo = "Munitions",
    F4vehicles = "Véhicules",

    -- Tab 1
    give_money = "Donner de l'argent au joueur regardé",
    drop_money = "Jeter de l'argent",
    change_name = "Changer de nom RP",
    go_to_sleep = "Dormir/Se réveiller",
    drop_weapon = "Jeter l'arme courante",
    buy_health = "Acheter des soins(%s)",
    request_gunlicense = "Demander une licence d'armes",
    demote_player_menu = "Rétrograder un joueur",

    searchwarrantbutton = "Poser un avis de recherche sur un individu",
    unwarrantbutton = "Retirer un avis de recherche d'un individu",
    noone_available = "Aucun n'est disponible",
    request_warrant = "Faire une demande d'avis de recherche pour in individu",
    make_wanted = "Faire rechercher quelqu'un",
    make_unwanted = "Retirer un avis recherche sur quelqu'un",
    set_jailpos = "Définir la position de la cellule",
    add_jailpos = "Ajouter une cellule",

    set_custom_job = "Définir un job personnalisé (appuyez sur Entrée pour confirmer)",

    set_agenda = "Définir un agenda (appuyez sur Entrée pour activer)",

    initiate_lockdown = "Déclarer l'état d'urgence",
    stop_lockdown = "Déclarer la fin de l'état d'urgence",
    start_lottery = "Initier une loterie",
    give_license_lookingat = "Donner <lookingat> une licence d'armes",

    laws_of_the_land = "Les lois de la ville",
    law_added = "Loi ajoutée.",
    law_removed = "Loi supprimée.",
    law_reset = "Lois ré-initialisées.",
    law_too_short = "Loi trop courte.",
    laws_full = "Vous avez atteint le nombre maximum de lois.",
    default_law_change_denied = "Vous n'êtes pas autorisé à modifier les lois par défaut.",

    -- Second tab
    job_name = "Nom: ",
    job_description = "Description: ",
    job_weapons = "Armes: ",

    -- Entities tab
    buy_a = "Acheter %s: %s",

    -- Licenseweaponstab
    license_tab = [[Armes licenciées

    Cochez les armes qui ne nécessitent pas de licences !
    ]],
    license_tab_other_weapons = "Autres armes:",
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("fr", my_language)
