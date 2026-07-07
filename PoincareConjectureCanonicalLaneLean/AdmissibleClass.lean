import PoincareConjectureCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure AdmissibleClass where
  object : PoincareAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PoincareWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
