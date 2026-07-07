import PoincareConjectureCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PoincareSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PoincareAdmittedObject where
  space : PoincareSpace
  closedThreeManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure PoincareEndgameState where
  object : PoincareAdmittedObject

def PoincareWitnessClosed (O : PoincareAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
