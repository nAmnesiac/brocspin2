set res50_atoms [atomselect top "resid 50"]
set res50_indices [$res50_atoms get index]
set other_atoms [atomselect top "not resid 50"]

foreach idx $res50_indices {
    set atom1 [atomselect top "index $idx"]
    set atom1_resname [$atom1 get resname]
    set atom1_coords [lindex [$atom1 get {x y z}] 0]
    set atom1_id [expr $idx + 1]
    
    set distances {}
    foreach other_idx [$other_atoms get index] {
        set atom2 [atomselect top "index $other_idx"]
        set atom2_coords [lindex [$atom2 get {x y z}] 0]
        set dist [veclength [vecsub $atom1_coords $atom2_coords]]
        lappend distances [list $dist $other_idx]
        $atom2 delete
    }
    
    set sorted_distances [lsort -real -index 0 $distances]
    set closest_three [lrange $sorted_distances 0 2]
    
    foreach pair $closest_three {
        set dist [lindex $pair 0]
        set other_idx [lindex $pair 1]
        set atom2 [atomselect top "index $other_idx"]
        set atom2_resname [$atom2 get resname]
        set atom2_id [expr $other_idx + 1]
        set dist_nm [expr $dist / 10.0]
        puts [format "%d %d %s %s %.3f" $atom1_id $atom2_id $atom1_resname $atom2_resname $dist_nm]
        $atom2 delete
    }
    $atom1 delete
}

$res50_atoms delete
$other_atoms delete
