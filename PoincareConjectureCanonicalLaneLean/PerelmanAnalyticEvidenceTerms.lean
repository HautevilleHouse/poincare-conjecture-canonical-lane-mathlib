import PoincareConjectureCanonicalLaneLean.PerelmanAnalyticProof

/-!
# Perelman Analytic Evidence Terms

This module exposes the proof terms carried by each analytic certificate. The
route is term-level: every analytic field has a named Lean term, and those terms
project into the Perelman route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) where
  riemannTensorSymmetries : C.riemannTensorSymmetries
  bianchiIdentities : C.bianchiIdentities
  ricciContractionLaw : C.ricciContractionLaw
  scalarTraceLaw : C.scalarTraceLaw
  curvatureEvolutionInputs : C.curvatureEvolutionInputs
  curvatureClosed : RiemannianCurvatureClosed G

def CurvatureAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : CurvatureAnalyticEvidenceTerms C := {
  riemannTensorSymmetries := C.riemannTensorSymmetriesClosed
  bianchiIdentities := C.bianchiIdentitiesClosed
  ricciContractionLaw := C.ricciContractionLawClosed
  scalarTraceLaw := C.scalarTraceLawClosed
  curvatureEvolutionInputs := C.curvatureEvolutionInputsClosed
  curvatureClosed := riemannian_curvature_closed_from_evidence G C.curvatureEvidence
}

structure HamiltonDeTurckEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) where
  gaugeChoice : H.gaugeChoice
  stronglyParabolicReduction : H.stronglyParabolicReduction
  deTurckVectorField : H.deTurckVectorField
  pullbackRecoversRicciFlow : H.pullbackRecoversRicciFlow
  uniquenessCompatibility : H.uniquenessCompatibility
  flowClosed : RicciFlowPDEClosed F

def HamiltonDeTurckCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckEvidenceTerms H := {
  gaugeChoice := H.gaugeChoiceClosed
  stronglyParabolicReduction := H.stronglyParabolicReductionClosed
  deTurckVectorField := H.deTurckVectorFieldClosed
  pullbackRecoversRicciFlow := H.pullbackRecoversRicciFlowClosed
  uniquenessCompatibility := H.uniquenessCompatibilityClosed
  flowClosed := ricci_flow_pde_closed_from_evidence F H.flowEvidence
}

structure ShortTimeEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) where
  parabolicRegularity : C.parabolicRegularity
  localExistenceInterval : C.localExistenceInterval
  uniquenessOnOverlap : C.uniquenessOnOverlap
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : ShortTimeEvidenceTerms C := {
  parabolicRegularity := C.parabolicRegularityClosed
  localExistenceInterval := C.localExistenceIntervalClosed
  uniquenessOnOverlap := C.uniquenessOnOverlapClosed
  continuationCriterion := C.continuationCriterionClosed
  shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
}

structure EntropyEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) where
  conjugateHeatEquation : C.conjugateHeatEquation
  wFunctionalDefined : C.wFunctionalDefined
  muFunctionalDefined : C.muFunctionalDefined
  entropyMonotonicityFormula : C.entropyMonotonicityFormula
  reducedVolumeMonotonicity : C.reducedVolumeMonotonicity
  entropyClosed : PerelmanEntropyClosed E

def EntropyAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) :
    EntropyEvidenceTerms C := {
  conjugateHeatEquation := C.conjugateHeatEquationClosed
  wFunctionalDefined := C.wFunctionalDefinedClosed
  muFunctionalDefined := C.muFunctionalDefinedClosed
  entropyMonotonicityFormula := C.entropyMonotonicityFormulaClosed
  reducedVolumeMonotonicity := C.reducedVolumeMonotonicityClosed
  entropyClosed := perelman_entropy_closed_from_evidence E C.entropyEvidence
}

structure NoncollapsingEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) where
  noLocalCollapsing : C.noLocalCollapsing
  scaleInvariantVolumeLowerBound : C.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility : C.curvatureScaleCompatibility
  ancientSolutionCompactnessInput : C.ancientSolutionCompactnessInput
  noncollapsingClosed : NoncollapsingClosed N

def NoncollapsingAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : NoncollapsingEvidenceTerms C := {
  noLocalCollapsing := C.noLocalCollapsingClosed
  scaleInvariantVolumeLowerBound := C.scaleInvariantVolumeLowerBoundClosed
  curvatureScaleCompatibility := C.curvatureScaleCompatibilityClosed
  ancientSolutionCompactnessInput := C.ancientSolutionCompactnessInputClosed
  noncollapsingClosed := noncollapsing_closed_from_evidence N C.noncollapsingEvidence
}

structure SingularityEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) where
  blowupSequenceChosen : C.blowupSequenceChosen
  pointedLimitExists : C.pointedLimitExists
  ancientKappaSolution : C.ancientKappaSolution
  asymptoticShrinkersControlled : C.asymptoticShrinkersControlled
  singularityModelsClosed : SingularityModelsClosed Q

def SingularityAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) :
    SingularityEvidenceTerms C := {
  blowupSequenceChosen := C.blowupSequenceChosenClosed
  pointedLimitExists := C.pointedLimitExistsClosed
  ancientKappaSolution := C.ancientKappaSolutionClosed
  asymptoticShrinkersControlled := C.asymptoticShrinkersControlledClosed
  singularityModelsClosed := singularity_models_closed_from_evidence Q C.singularityEvidence
}

structure CanonicalNeighborhoodEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) where
  highCurvaturePointClassified : P.highCurvaturePointClassified
  neckCapOrRoundComponent : P.neckCapOrRoundComponent
  surgeryScaleAdmissible : P.surgeryScaleAdmissible
  persistenceUnderFlow : P.persistenceUnderFlow
  canonicalNeighborhoodsClosed : CanonicalNeighborhoodsClosed C

def CanonicalNeighborhoodAnalyticCertificate.evidenceTerms
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E} {Q : SingularityModelsPackage N}
    {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) :
    CanonicalNeighborhoodEvidenceTerms P := {
  highCurvaturePointClassified := P.highCurvaturePointClassifiedClosed
  neckCapOrRoundComponent := P.neckCapOrRoundComponentClosed
  surgeryScaleAdmissible := P.surgeryScaleAdmissibleClosed
  persistenceUnderFlow := P.persistenceUnderFlowClosed
  canonicalNeighborhoodsClosed := canonical_neighborhoods_closed_from_evidence C P.neighborhoodEvidence
}

structure SurgeryEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (P : SurgeryAnalyticCertificate U) where
  cutoffParametersChosen : P.cutoffParametersChosen
  standardCapInserted : P.standardCapInserted
  postSurgeryCurvatureControlled : P.postSurgeryCurvatureControlled
  noncollapsingPreserved : P.noncollapsingPreserved
  surgeryInductionContinues : P.surgeryInductionContinues
  surgeryClosed : SurgeryClosed U

def SurgeryAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} (P : SurgeryAnalyticCertificate U) :
    SurgeryEvidenceTerms P := {
  cutoffParametersChosen := P.cutoffParametersChosenClosed
  standardCapInserted := P.standardCapInsertedClosed
  postSurgeryCurvatureControlled := P.postSurgeryCurvatureControlledClosed
  noncollapsingPreserved := P.noncollapsingPreservedClosed
  surgeryInductionContinues := P.surgeryInductionContinuesClosed
  surgeryClosed := surgery_closed_from_evidence U P.surgeryEvidence
}

structure GeometrizationEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (P : GeometrizationAnalyticCertificate Z) where
  thickThinDecomposition : P.thickThinDecomposition
  finiteExtinctionAlternative : P.finiteExtinctionAlternative
  primeDecompositionControlled : P.primeDecompositionControlled
  geometrizationPiecesClassified : P.geometrizationPiecesClassified
  geometrizationClosed : GeometrizationClosed Z

def GeometrizationAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    (P : GeometrizationAnalyticCertificate Z) : GeometrizationEvidenceTerms P := {
  thickThinDecomposition := P.thickThinDecompositionClosed
  finiteExtinctionAlternative := P.finiteExtinctionAlternativeClosed
  primeDecompositionControlled := P.primeDecompositionControlledClosed
  geometrizationPiecesClassified := P.geometrizationPiecesClassifiedClosed
  geometrizationClosed := geometrization_closed_from_evidence Z P.geometrizationEvidence
}

structure EndpointEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    {Y : EndpointClassificationPackage Z} (P : EndpointAnalyticCertificate Y) where
  sphericalSpaceFormExcluded : P.sphericalSpaceFormExcluded
  simplyConnectedEndpoint : P.simplyConnectedEndpoint
  sphereDiffeomorphismProduced : P.sphereDiffeomorphismProduced
  endpointClassificationClosed : EndpointClassificationClosed Y
  mathlibSphereEndpoint :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      Y.targetManifold Y.targetTopology 3

def EndpointAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    {U : SurgeryPackage C} {Z : GeometrizationPackage U}
    {Y : EndpointClassificationPackage Z} (P : EndpointAnalyticCertificate Y) :
    EndpointEvidenceTerms P := {
  sphericalSpaceFormExcluded := P.sphericalSpaceFormExcludedClosed
  simplyConnectedEndpoint := P.simplyConnectedEndpointClosed
  sphereDiffeomorphismProduced := P.sphereDiffeomorphismProducedClosed
  endpointClassificationClosed := endpoint_classification_closed_from_evidence Y P.endpointEvidence
  mathlibSphereEndpoint := endpoint_classification_supplies_mathlib_statement Y
}

structure PerelmanAnalyticEvidenceTerms {A : RicciFlowAnalyticFoundation}
    (P : PerelmanAnalyticProofCertificate A) where
  curvature : CurvatureAnalyticEvidenceTerms P.curvature
  flow : HamiltonDeTurckEvidenceTerms P.flow
  shortTime : ShortTimeEvidenceTerms P.shortTime
  entropy : EntropyEvidenceTerms P.entropy
  noncollapsing : NoncollapsingEvidenceTerms P.noncollapsing
  singularity : SingularityEvidenceTerms P.singularity
  canonicalNeighborhood : CanonicalNeighborhoodEvidenceTerms P.canonicalNeighborhood
  surgery : SurgeryEvidenceTerms P.surgery
  geometrization : GeometrizationEvidenceTerms P.geometrization
  endpoint : EndpointEvidenceTerms P.endpoint
  analyticCertificateClosed : PerelmanAnalyticProofCertificateClosed P
  routeClosed : PerelmanRouteClosed A.toPerelmanRouteObligations
  mathlibSphereEndpoint :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetManifold A.endpoint.targetTopology 3

def PerelmanAnalyticProofCertificate.evidenceTerms
    {A : RicciFlowAnalyticFoundation} (P : PerelmanAnalyticProofCertificate A) :
    PerelmanAnalyticEvidenceTerms P := {
  curvature := P.curvature.evidenceTerms
  flow := P.flow.evidenceTerms
  shortTime := P.shortTime.evidenceTerms
  entropy := P.entropy.evidenceTerms
  noncollapsing := P.noncollapsing.evidenceTerms
  singularity := P.singularity.evidenceTerms
  canonicalNeighborhood := P.canonicalNeighborhood.evidenceTerms
  surgery := P.surgery.evidenceTerms
  geometrization := P.geometrization.evidenceTerms
  endpoint := P.endpoint.evidenceTerms
  analyticCertificateClosed := perelman_analytic_proof_certificate_closed P
  routeClosed := perelman_analytic_proof_closes_route P
  mathlibSphereEndpoint := perelman_analytic_proof_supplies_mathlib_sphere_endpoint P
}

theorem perelman_analytic_evidence_terms_close_route
    {A : RicciFlowAnalyticFoundation} (P : PerelmanAnalyticProofCertificate A) :
    (P.evidenceTerms).routeClosed = perelman_analytic_proof_closes_route P := by
  rfl

theorem perelman_analytic_evidence_terms_supply_endpoint
    {A : RicciFlowAnalyticFoundation} (P : PerelmanAnalyticProofCertificate A) :
    (P.evidenceTerms).mathlibSphereEndpoint =
      perelman_analytic_proof_supplies_mathlib_sphere_endpoint P := by
  rfl

theorem perelman_analytic_evidence_terms_yield_constrained_closure
    (A : AdmissibleClass) {R : RicciFlowAnalyticFoundation}
    (P : PerelmanAnalyticProofCertificate R)
    (bridgeFromEvidenceTerms : bridgeClosed A)
    (gateFromEvidenceTerms : gateClosed A) :
    ConstrainedPoincareClosure A := by
  exact perelman_analytic_proof_yields_constrained_poincare_closure
    A P bridgeFromEvidenceTerms gateFromEvidenceTerms

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
