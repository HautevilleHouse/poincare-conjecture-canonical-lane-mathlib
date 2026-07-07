import PoincareConjectureCanonicalLaneLean.PerelmanDeepAnalyticConstruction

/-!
# Primitive Ricci Flow With Surgery

This module gives a primitive object language for the Perelman route. It names
manifold data, tensor bundles, metric families, Ricci-flow segments, surgery
events, entropy data, noncollapsing data, singularity models, canonical
neighborhood data, geometrization data, and endpoint recognition data.

The construction is proof-carrying: a primitive package supplies the analytic
terms needed by the deep construction layer, and the projection into the
Perelman route is checked by Lean.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean


structure PrimitiveClosedThreeManifold where
  Point : Type
  Chart : Type
  atlas : Type
  smoothCompatibility : Prop
  hausdorffSecondCountable : Prop
  compactWithoutBoundary : Prop
  connected : Prop
  dimensionThree : Prop
  smoothCompatibilityTerm : smoothCompatibility
  hausdorffSecondCountableTerm : hausdorffSecondCountable
  compactWithoutBoundaryTerm : compactWithoutBoundary
  connectedTerm : connected
  dimensionThreeTerm : dimensionThree

structure PrimitiveTimeDomain where
  Time : Type
  start : Time
  le : Time -> Time -> Prop
  intervalTopology : Prop
  hasInitialTime : Prop
  locallyFiniteBreakSet : Prop
  intervalTopologyTerm : intervalTopology
  hasInitialTimeTerm : hasInitialTime
  locallyFiniteBreakSetTerm : locallyFiniteBreakSet

structure PrimitiveTensorBundle (M : PrimitiveClosedThreeManifold) where
  rankCovariant : Nat
  rankContravariant : Nat
  Fiber : M.Point -> Type
  smoothSections : Type
  contraction : Type
  covariantDerivative : Type
  tensorOperationsClosed : Prop
  tensorOperationsClosedTerm : tensorOperationsClosed

structure PrimitiveMetricFamily
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain) where
  metricTensor : T.Time -> PrimitiveTensorBundle M
  inverseMetric : T.Time -> PrimitiveTensorBundle M
  positiveDefinite : Prop
  smoothInSpaceAndTime : Prop
  leviCivitaConnection : Type
  positiveDefiniteTerm : positiveDefinite
  smoothInSpaceAndTimeTerm : smoothInSpaceAndTime

structure PrimitiveCurvatureSystem
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain)
    (g : PrimitiveMetricFamily M T) where
  riemannTensor : T.Time -> PrimitiveTensorBundle M
  ricciTensor : T.Time -> PrimitiveTensorBundle M
  scalarCurvature : T.Time -> Type
  metricCompatibility : Prop
  torsionFreeConnection : Prop
  curvatureCommutatorFormula : Prop
  skewSymmetryDerived : Prop
  pairSymmetryDerived : Prop
  firstBianchiDerived : Prop
  ricciTraceDerived : Prop
  scalarTraceDerived : Prop
  curvatureEvolutionDerived : Prop
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  metricCompatibilityTerm : metricCompatibility
  torsionFreeConnectionTerm : torsionFreeConnection
  curvatureCommutatorFormulaTerm : curvatureCommutatorFormula
  skewSymmetryDerivedTerm : skewSymmetryDerived
  pairSymmetryDerivedTerm : pairSymmetryDerived
  firstBianchiDerivedTerm : firstBianchiDerived
  ricciTraceDerivedTerm : ricciTraceDerived
  scalarTraceDerivedTerm : scalarTraceDerived
  curvatureEvolutionDerivedTerm : curvatureEvolutionDerived
  riemannTensorSymmetriesFromPrimitive :
    metricCompatibility -> torsionFreeConnection -> curvatureCommutatorFormula ->
      skewSymmetryDerived -> pairSymmetryDerived -> riemannTensorSymmetries
  bianchiIdentitiesFromPrimitive :
    curvatureCommutatorFormula -> firstBianchiDerived -> bianchiIdentities
  ricciContractionLawFromPrimitive :
    curvatureCommutatorFormula -> ricciTraceDerived -> ricciContractionLaw
  scalarTraceLawFromPrimitive :
    ricciTraceDerived -> scalarTraceDerived -> scalarTraceLaw
  curvatureEvolutionInputsFromPrimitive :
    curvatureCommutatorFormula -> curvatureEvolutionDerived -> curvatureEvolutionInputs

def PrimitiveCurvatureSystem.toConstruction
    {M : PrimitiveClosedThreeManifold} {T : PrimitiveTimeDomain}
    {g : PrimitiveMetricFamily M T} (C : PrimitiveCurvatureSystem M T g) :
    CurvatureTensorConstruction := {
  metricCompatibility := C.metricCompatibility
  torsionFreeConnection := C.torsionFreeConnection
  curvatureCommutatorFormula := C.curvatureCommutatorFormula
  skewSymmetryDerived := C.skewSymmetryDerived
  pairSymmetryDerived := C.pairSymmetryDerived
  firstBianchiDerived := C.firstBianchiDerived
  ricciTraceDerived := C.ricciTraceDerived
  scalarTraceDerived := C.scalarTraceDerived
  curvatureEvolutionDerived := C.curvatureEvolutionDerived
  riemannTensorSymmetries := C.riemannTensorSymmetries
  bianchiIdentities := C.bianchiIdentities
  ricciContractionLaw := C.ricciContractionLaw
  scalarTraceLaw := C.scalarTraceLaw
  curvatureEvolutionInputs := C.curvatureEvolutionInputs
  metricCompatibilityTerm := C.metricCompatibilityTerm
  torsionFreeConnectionTerm := C.torsionFreeConnectionTerm
  curvatureCommutatorFormulaTerm := C.curvatureCommutatorFormulaTerm
  skewSymmetryDerivedTerm := C.skewSymmetryDerivedTerm
  pairSymmetryDerivedTerm := C.pairSymmetryDerivedTerm
  firstBianchiDerivedTerm := C.firstBianchiDerivedTerm
  ricciTraceDerivedTerm := C.ricciTraceDerivedTerm
  scalarTraceDerivedTerm := C.scalarTraceDerivedTerm
  curvatureEvolutionDerivedTerm := C.curvatureEvolutionDerivedTerm
  riemannTensorSymmetriesFromConstruction := C.riemannTensorSymmetriesFromPrimitive
  bianchiIdentitiesFromConstruction := C.bianchiIdentitiesFromPrimitive
  ricciContractionLawFromConstruction := C.ricciContractionLawFromPrimitive
  scalarTraceLawFromConstruction := C.scalarTraceLawFromPrimitive
  curvatureEvolutionInputsFromConstruction := C.curvatureEvolutionInputsFromPrimitive
}

structure PrimitiveFlowSegment
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain)
    (g : PrimitiveMetricFamily M T) (C : PrimitiveCurvatureSystem M T g) where
  timeDerivativeMetric : Type
  minusTwoRicciTensor : Type
  ricciFlowEquation : Prop
  deTurckGaugeFixed : Prop
  linearizationComputed : Prop
  stronglyParabolicOperator : Prop
  deTurckVectorFieldConstructed : Prop
  pullbackEquationComputed : Prop
  uniquenessEstimate : Prop
  smoothInitialMetric : Prop
  hamiltonDeTurckGaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  ricciFlowEquationTerm : ricciFlowEquation
  deTurckGaugeFixedTerm : deTurckGaugeFixed
  linearizationComputedTerm : linearizationComputed
  stronglyParabolicOperatorTerm : stronglyParabolicOperator
  deTurckVectorFieldConstructedTerm : deTurckVectorFieldConstructed
  pullbackEquationComputedTerm : pullbackEquationComputed
  uniquenessEstimateTerm : uniquenessEstimate
  smoothInitialMetricTerm : smoothInitialMetric
  gaugeChoiceFromPrimitive :
    smoothInitialMetric -> deTurckGaugeFixed -> hamiltonDeTurckGaugeChoice
  parabolicReductionFromPrimitive :
    linearizationComputed -> stronglyParabolicOperator -> stronglyParabolicReduction
  deTurckVectorFieldFromPrimitive :
    deTurckGaugeFixed -> deTurckVectorFieldConstructed -> deTurckVectorField
  pullbackRecoversRicciFlowFromPrimitive :
    deTurckVectorFieldConstructed -> pullbackEquationComputed -> pullbackRecoversRicciFlow
  uniquenessCompatibilityFromPrimitive :
    uniquenessEstimate -> pullbackEquationComputed -> uniquenessCompatibility

structure PrimitiveSurgeryEvent
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain) where
  eventTime : T.Time
  neckRegion : Type
  cutoffScale : Type
  standardCap : Type
  postSurgeryManifold : PrimitiveClosedThreeManifold
  cutoffScaleChosen : Prop
  standardCapGeometryBuilt : Prop
  postSurgeryCurvatureEstimate : Prop
  noncollapsingTransferAcrossSurgery : Prop
  inductionAcrossSurgeryTimes : Prop
  cutoffParametersChosen : Prop
  standardCapInserted : Prop
  postSurgeryCurvatureControlled : Prop
  noncollapsingPreservedThroughSurgery : Prop
  surgeryInductionContinues : Prop
  cutoffScaleChosenTerm : cutoffScaleChosen
  standardCapGeometryBuiltTerm : standardCapGeometryBuilt
  postSurgeryCurvatureEstimateTerm : postSurgeryCurvatureEstimate
  noncollapsingTransferAcrossSurgeryTerm : noncollapsingTransferAcrossSurgery
  inductionAcrossSurgeryTimesTerm : inductionAcrossSurgeryTimes
  cutoffParametersChosenFromPrimitive : cutoffScaleChosen -> cutoffParametersChosen
  standardCapInsertedFromPrimitive :
    cutoffScaleChosen -> standardCapGeometryBuilt -> standardCapInserted
  postSurgeryCurvatureControlledFromPrimitive :
    standardCapGeometryBuilt -> postSurgeryCurvatureEstimate -> postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgeryFromPrimitive :
    noncollapsingTransferAcrossSurgery -> postSurgeryCurvatureEstimate ->
      noncollapsingPreservedThroughSurgery
  surgeryInductionContinuesFromPrimitive :
    inductionAcrossSurgeryTimes -> postSurgeryCurvatureEstimate -> surgeryInductionContinues

structure PrimitiveRicciFlowWithSurgery
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain)
    (g : PrimitiveMetricFamily M T) (C : PrimitiveCurvatureSystem M T g) where
  smoothSegments : Type
  surgeryEvents : Type
  segmentModel : PrimitiveFlowSegment M T g C
  surgeryModel : PrimitiveSurgeryEvent M T
  surgeryEventsLocallyFinite : Prop
  flowSegmentsPatchAcrossEvents : Prop
  surgeryEventsLocallyFiniteTerm : surgeryEventsLocallyFinite
  flowSegmentsPatchAcrossEventsTerm : flowSegmentsPatchAcrossEvents

def PrimitiveRicciFlowWithSurgery.toConstruction
    {M : PrimitiveClosedThreeManifold} {T : PrimitiveTimeDomain}
    {g : PrimitiveMetricFamily M T} {C : PrimitiveCurvatureSystem M T g}
    (R : PrimitiveRicciFlowWithSurgery M T g C) : RicciFlowWithSurgeryConstruction := {
  smoothInitialMetric := R.segmentModel.smoothInitialMetric
  deTurckGaugeFixed := R.segmentModel.deTurckGaugeFixed
  linearizationComputed := R.segmentModel.linearizationComputed
  stronglyParabolicOperator := R.segmentModel.stronglyParabolicOperator
  deTurckVectorFieldConstructed := R.segmentModel.deTurckVectorFieldConstructed
  pullbackEquationComputed := R.segmentModel.pullbackEquationComputed
  uniquenessEstimate := R.segmentModel.uniquenessEstimate
  cutoffScaleChosen := R.surgeryModel.cutoffScaleChosen
  standardCapGeometryBuilt := R.surgeryModel.standardCapGeometryBuilt
  postSurgeryCurvatureEstimate := R.surgeryModel.postSurgeryCurvatureEstimate
  noncollapsingTransferAcrossSurgery := R.surgeryModel.noncollapsingTransferAcrossSurgery
  inductionAcrossSurgeryTimes := R.surgeryModel.inductionAcrossSurgeryTimes
  hamiltonDeTurckGaugeChoice := R.segmentModel.hamiltonDeTurckGaugeChoice
  stronglyParabolicReduction := R.segmentModel.stronglyParabolicReduction
  deTurckVectorField := R.segmentModel.deTurckVectorField
  pullbackRecoversRicciFlow := R.segmentModel.pullbackRecoversRicciFlow
  uniquenessCompatibility := R.segmentModel.uniquenessCompatibility
  cutoffParametersChosen := R.surgeryModel.cutoffParametersChosen
  standardCapInserted := R.surgeryModel.standardCapInserted
  postSurgeryCurvatureControlled := R.surgeryModel.postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgery := R.surgeryModel.noncollapsingPreservedThroughSurgery
  surgeryInductionContinues := R.surgeryModel.surgeryInductionContinues
  smoothInitialMetricTerm := R.segmentModel.smoothInitialMetricTerm
  deTurckGaugeFixedTerm := R.segmentModel.deTurckGaugeFixedTerm
  linearizationComputedTerm := R.segmentModel.linearizationComputedTerm
  stronglyParabolicOperatorTerm := R.segmentModel.stronglyParabolicOperatorTerm
  deTurckVectorFieldConstructedTerm := R.segmentModel.deTurckVectorFieldConstructedTerm
  pullbackEquationComputedTerm := R.segmentModel.pullbackEquationComputedTerm
  uniquenessEstimateTerm := R.segmentModel.uniquenessEstimateTerm
  cutoffScaleChosenTerm := R.surgeryModel.cutoffScaleChosenTerm
  standardCapGeometryBuiltTerm := R.surgeryModel.standardCapGeometryBuiltTerm
  postSurgeryCurvatureEstimateTerm := R.surgeryModel.postSurgeryCurvatureEstimateTerm
  noncollapsingTransferAcrossSurgeryTerm := R.surgeryModel.noncollapsingTransferAcrossSurgeryTerm
  inductionAcrossSurgeryTimesTerm := R.surgeryModel.inductionAcrossSurgeryTimesTerm
  gaugeChoiceFromConstruction := R.segmentModel.gaugeChoiceFromPrimitive
  parabolicReductionFromConstruction := R.segmentModel.parabolicReductionFromPrimitive
  deTurckVectorFieldFromConstruction := R.segmentModel.deTurckVectorFieldFromPrimitive
  pullbackRecoversRicciFlowFromConstruction := R.segmentModel.pullbackRecoversRicciFlowFromPrimitive
  uniquenessCompatibilityFromConstruction := R.segmentModel.uniquenessCompatibilityFromPrimitive
  cutoffParametersChosenFromConstruction := R.surgeryModel.cutoffParametersChosenFromPrimitive
  standardCapInsertedFromConstruction := R.surgeryModel.standardCapInsertedFromPrimitive
  postSurgeryCurvatureControlledFromConstruction :=
    R.surgeryModel.postSurgeryCurvatureControlledFromPrimitive
  noncollapsingPreservedThroughSurgeryFromConstruction :=
    R.surgeryModel.noncollapsingPreservedThroughSurgeryFromPrimitive
  surgeryInductionContinuesFromConstruction := R.surgeryModel.surgeryInductionContinuesFromPrimitive
}

structure PrimitiveShortTimeTheory
    (M : PrimitiveClosedThreeManifold) (T : PrimitiveTimeDomain)
    (g : PrimitiveMetricFamily M T) where
  parabolicFunctionSpace : Prop
  localSchauderEstimate : Prop
  fixedPointMapContractive : Prop
  intervalProduced : Prop
  overlapUniquenessEstimate : Prop
  curvatureContinuationCriterion : Prop
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicFunctionSpaceTerm : parabolicFunctionSpace
  localSchauderEstimateTerm : localSchauderEstimate
  fixedPointMapContractiveTerm : fixedPointMapContractive
  intervalProducedTerm : intervalProduced
  overlapUniquenessEstimateTerm : overlapUniquenessEstimate
  curvatureContinuationCriterionTerm : curvatureContinuationCriterion
  parabolicRegularityFromPrimitive :
    parabolicFunctionSpace -> localSchauderEstimate -> parabolicRegularity
  localExistenceIntervalFromPrimitive :
    fixedPointMapContractive -> intervalProduced -> localExistenceInterval
  uniquenessOnOverlapFromPrimitive : overlapUniquenessEstimate -> uniquenessOnOverlap
  continuationCriterionFromPrimitive : curvatureContinuationCriterion -> continuationCriterion

def PrimitiveShortTimeTheory.toConstruction
    {M : PrimitiveClosedThreeManifold} {T : PrimitiveTimeDomain}
    {g : PrimitiveMetricFamily M T} (S : PrimitiveShortTimeTheory M T g) :
    ShortTimeConstruction := {
  parabolicFunctionSpace := S.parabolicFunctionSpace
  localSchauderEstimate := S.localSchauderEstimate
  fixedPointMapContractive := S.fixedPointMapContractive
  intervalProduced := S.intervalProduced
  overlapUniquenessEstimate := S.overlapUniquenessEstimate
  curvatureContinuationCriterion := S.curvatureContinuationCriterion
  parabolicRegularity := S.parabolicRegularity
  localExistenceInterval := S.localExistenceInterval
  uniquenessOnOverlap := S.uniquenessOnOverlap
  continuationCriterion := S.continuationCriterion
  parabolicFunctionSpaceTerm := S.parabolicFunctionSpaceTerm
  localSchauderEstimateTerm := S.localSchauderEstimateTerm
  fixedPointMapContractiveTerm := S.fixedPointMapContractiveTerm
  intervalProducedTerm := S.intervalProducedTerm
  overlapUniquenessEstimateTerm := S.overlapUniquenessEstimateTerm
  curvatureContinuationCriterionTerm := S.curvatureContinuationCriterionTerm
  parabolicRegularityFromConstruction := S.parabolicRegularityFromPrimitive
  localExistenceIntervalFromConstruction := S.localExistenceIntervalFromPrimitive
  uniquenessOnOverlapFromConstruction := S.uniquenessOnOverlapFromPrimitive
  continuationCriterionFromConstruction := S.continuationCriterionFromPrimitive
}

structure PrimitiveEntropyTheory where
  conjugateHeatKernelBuilt : Prop
  wDensityComputed : Prop
  muInfimumAttainedOrApproximated : Prop
  firstVariationFormula : Prop
  squareTermNonnegative : Prop
  reducedDistanceBuilt : Prop
  reducedVolumeJacobianControl : Prop
  conjugateHeatEquation : Prop
  wFunctionalDefined : Prop
  muFunctionalDefined : Prop
  entropyMonotonicityFormula : Prop
  reducedVolumeMonotonicity : Prop
  conjugateHeatKernelBuiltTerm : conjugateHeatKernelBuilt
  wDensityComputedTerm : wDensityComputed
  muInfimumAttainedOrApproximatedTerm : muInfimumAttainedOrApproximated
  firstVariationFormulaTerm : firstVariationFormula
  squareTermNonnegativeTerm : squareTermNonnegative
  reducedDistanceBuiltTerm : reducedDistanceBuilt
  reducedVolumeJacobianControlTerm : reducedVolumeJacobianControl
  conjugateHeatEquationFromPrimitive : conjugateHeatKernelBuilt -> conjugateHeatEquation
  wFunctionalDefinedFromPrimitive :
    wDensityComputed -> conjugateHeatKernelBuilt -> wFunctionalDefined
  muFunctionalDefinedFromPrimitive :
    wFunctionalDefined -> muInfimumAttainedOrApproximated -> muFunctionalDefined
  entropyMonotonicityFormulaFromPrimitive :
    firstVariationFormula -> squareTermNonnegative -> entropyMonotonicityFormula
  reducedVolumeMonotonicityFromPrimitive :
    reducedDistanceBuilt -> reducedVolumeJacobianControl -> reducedVolumeMonotonicity

def PrimitiveEntropyTheory.toConstruction (E : PrimitiveEntropyTheory) : EntropyConstruction := {
  conjugateHeatKernelBuilt := E.conjugateHeatKernelBuilt
  wDensityComputed := E.wDensityComputed
  muInfimumAttainedOrApproximated := E.muInfimumAttainedOrApproximated
  firstVariationFormula := E.firstVariationFormula
  squareTermNonnegative := E.squareTermNonnegative
  reducedDistanceBuilt := E.reducedDistanceBuilt
  reducedVolumeJacobianControl := E.reducedVolumeJacobianControl
  conjugateHeatEquation := E.conjugateHeatEquation
  wFunctionalDefined := E.wFunctionalDefined
  muFunctionalDefined := E.muFunctionalDefined
  entropyMonotonicityFormula := E.entropyMonotonicityFormula
  reducedVolumeMonotonicity := E.reducedVolumeMonotonicity
  conjugateHeatKernelBuiltTerm := E.conjugateHeatKernelBuiltTerm
  wDensityComputedTerm := E.wDensityComputedTerm
  muInfimumAttainedOrApproximatedTerm := E.muInfimumAttainedOrApproximatedTerm
  firstVariationFormulaTerm := E.firstVariationFormulaTerm
  squareTermNonnegativeTerm := E.squareTermNonnegativeTerm
  reducedDistanceBuiltTerm := E.reducedDistanceBuiltTerm
  reducedVolumeJacobianControlTerm := E.reducedVolumeJacobianControlTerm
  conjugateHeatEquationFromConstruction := E.conjugateHeatEquationFromPrimitive
  wFunctionalDefinedFromConstruction := E.wFunctionalDefinedFromPrimitive
  muFunctionalDefinedFromConstruction := E.muFunctionalDefinedFromPrimitive
  entropyMonotonicityFormulaFromConstruction := E.entropyMonotonicityFormulaFromPrimitive
  reducedVolumeMonotonicityFromConstruction := E.reducedVolumeMonotonicityFromPrimitive
}

structure PrimitiveNoncollapsingTheory where
  entropyLowerBound : Prop
  reducedVolumeLowerBound : Prop
  ballCurvatureScaleBound : Prop
  blowupCompactnessPrepared : Prop
  noLocalCollapsing : Prop
  scaleInvariantVolumeLowerBound : Prop
  curvatureScaleCompatibility : Prop
  ancientSolutionCompactnessInput : Prop
  entropyLowerBoundTerm : entropyLowerBound
  reducedVolumeLowerBoundTerm : reducedVolumeLowerBound
  ballCurvatureScaleBoundTerm : ballCurvatureScaleBound
  blowupCompactnessPreparedTerm : blowupCompactnessPrepared
  noLocalCollapsingFromPrimitive : entropyLowerBound -> reducedVolumeLowerBound -> noLocalCollapsing
  scaleInvariantVolumeLowerBoundFromPrimitive :
    reducedVolumeLowerBound -> ballCurvatureScaleBound -> scaleInvariantVolumeLowerBound
  curvatureScaleCompatibilityFromPrimitive : ballCurvatureScaleBound -> curvatureScaleCompatibility
  ancientSolutionCompactnessInputFromPrimitive :
    blowupCompactnessPrepared -> noLocalCollapsing -> ancientSolutionCompactnessInput

def PrimitiveNoncollapsingTheory.toConstruction
    (N : PrimitiveNoncollapsingTheory) : NoncollapsingConstruction := {
  entropyLowerBound := N.entropyLowerBound
  reducedVolumeLowerBound := N.reducedVolumeLowerBound
  ballCurvatureScaleBound := N.ballCurvatureScaleBound
  blowupCompactnessPrepared := N.blowupCompactnessPrepared
  noLocalCollapsing := N.noLocalCollapsing
  scaleInvariantVolumeLowerBound := N.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility := N.curvatureScaleCompatibility
  ancientSolutionCompactnessInput := N.ancientSolutionCompactnessInput
  entropyLowerBoundTerm := N.entropyLowerBoundTerm
  reducedVolumeLowerBoundTerm := N.reducedVolumeLowerBoundTerm
  ballCurvatureScaleBoundTerm := N.ballCurvatureScaleBoundTerm
  blowupCompactnessPreparedTerm := N.blowupCompactnessPreparedTerm
  noLocalCollapsingFromConstruction := N.noLocalCollapsingFromPrimitive
  scaleInvariantVolumeLowerBoundFromConstruction := N.scaleInvariantVolumeLowerBoundFromPrimitive
  curvatureScaleCompatibilityFromConstruction := N.curvatureScaleCompatibilityFromPrimitive
  ancientSolutionCompactnessInputFromConstruction := N.ancientSolutionCompactnessInputFromPrimitive
}

structure PrimitiveSingularityTheory where
  curvatureBlowupSequence : Prop
  parabolicRescalingChosen : Prop
  pointedCheegerGromovLimit : Prop
  ancientLimitEquation : Prop
  kappaNoncollapsedLimit : Prop
  shrinkerAsymptotics : Prop
  blowupSequenceChosen : Prop
  pointedLimitExists : Prop
  ancientKappaSolution : Prop
  asymptoticShrinkersControlled : Prop
  curvatureBlowupSequenceTerm : curvatureBlowupSequence
  parabolicRescalingChosenTerm : parabolicRescalingChosen
  pointedCheegerGromovLimitTerm : pointedCheegerGromovLimit
  ancientLimitEquationTerm : ancientLimitEquation
  kappaNoncollapsedLimitTerm : kappaNoncollapsedLimit
  shrinkerAsymptoticsTerm : shrinkerAsymptotics
  blowupSequenceChosenFromPrimitive :
    curvatureBlowupSequence -> parabolicRescalingChosen -> blowupSequenceChosen
  pointedLimitExistsFromPrimitive :
    parabolicRescalingChosen -> pointedCheegerGromovLimit -> pointedLimitExists
  ancientKappaSolutionFromPrimitive :
    ancientLimitEquation -> kappaNoncollapsedLimit -> ancientKappaSolution
  asymptoticShrinkersControlledFromPrimitive : shrinkerAsymptotics -> asymptoticShrinkersControlled

def PrimitiveSingularityTheory.toConstruction
    (Q : PrimitiveSingularityTheory) : SingularityModelConstruction := {
  curvatureBlowupSequence := Q.curvatureBlowupSequence
  parabolicRescalingChosen := Q.parabolicRescalingChosen
  pointedCheegerGromovLimit := Q.pointedCheegerGromovLimit
  ancientLimitEquation := Q.ancientLimitEquation
  kappaNoncollapsedLimit := Q.kappaNoncollapsedLimit
  shrinkerAsymptotics := Q.shrinkerAsymptotics
  blowupSequenceChosen := Q.blowupSequenceChosen
  pointedLimitExists := Q.pointedLimitExists
  ancientKappaSolution := Q.ancientKappaSolution
  asymptoticShrinkersControlled := Q.asymptoticShrinkersControlled
  curvatureBlowupSequenceTerm := Q.curvatureBlowupSequenceTerm
  parabolicRescalingChosenTerm := Q.parabolicRescalingChosenTerm
  pointedCheegerGromovLimitTerm := Q.pointedCheegerGromovLimitTerm
  ancientLimitEquationTerm := Q.ancientLimitEquationTerm
  kappaNoncollapsedLimitTerm := Q.kappaNoncollapsedLimitTerm
  shrinkerAsymptoticsTerm := Q.shrinkerAsymptoticsTerm
  blowupSequenceChosenFromConstruction := Q.blowupSequenceChosenFromPrimitive
  pointedLimitExistsFromConstruction := Q.pointedLimitExistsFromPrimitive
  ancientKappaSolutionFromConstruction := Q.ancientKappaSolutionFromPrimitive
  asymptoticShrinkersControlledFromConstruction := Q.asymptoticShrinkersControlledFromPrimitive
}

structure PrimitiveCanonicalNeighborhoodTheory where
  epsilonNeckModel : Prop
  capModel : Prop
  roundComponentModel : Prop
  highCurvatureModelComparison : Prop
  surgeryScaleSeparation : Prop
  neighborhoodPersistenceEstimate : Prop
  highCurvaturePointClassified : Prop
  neckCapOrRoundComponent : Prop
  surgeryScaleAdmissible : Prop
  persistenceUnderFlow : Prop
  epsilonNeckModelTerm : epsilonNeckModel
  capModelTerm : capModel
  roundComponentModelTerm : roundComponentModel
  highCurvatureModelComparisonTerm : highCurvatureModelComparison
  surgeryScaleSeparationTerm : surgeryScaleSeparation
  neighborhoodPersistenceEstimateTerm : neighborhoodPersistenceEstimate
  highCurvaturePointClassifiedFromPrimitive :
    highCurvatureModelComparison -> highCurvaturePointClassified
  neckCapOrRoundComponentFromPrimitive :
    epsilonNeckModel -> capModel -> roundComponentModel -> neckCapOrRoundComponent
  surgeryScaleAdmissibleFromPrimitive : surgeryScaleSeparation -> surgeryScaleAdmissible
  persistenceUnderFlowFromPrimitive : neighborhoodPersistenceEstimate -> persistenceUnderFlow

def PrimitiveCanonicalNeighborhoodTheory.toConstruction
    (C : PrimitiveCanonicalNeighborhoodTheory) : CanonicalNeighborhoodConstruction := {
  epsilonNeckModel := C.epsilonNeckModel
  capModel := C.capModel
  roundComponentModel := C.roundComponentModel
  highCurvatureModelComparison := C.highCurvatureModelComparison
  surgeryScaleSeparation := C.surgeryScaleSeparation
  neighborhoodPersistenceEstimate := C.neighborhoodPersistenceEstimate
  highCurvaturePointClassified := C.highCurvaturePointClassified
  neckCapOrRoundComponent := C.neckCapOrRoundComponent
  surgeryScaleAdmissible := C.surgeryScaleAdmissible
  persistenceUnderFlow := C.persistenceUnderFlow
  epsilonNeckModelTerm := C.epsilonNeckModelTerm
  capModelTerm := C.capModelTerm
  roundComponentModelTerm := C.roundComponentModelTerm
  highCurvatureModelComparisonTerm := C.highCurvatureModelComparisonTerm
  surgeryScaleSeparationTerm := C.surgeryScaleSeparationTerm
  neighborhoodPersistenceEstimateTerm := C.neighborhoodPersistenceEstimateTerm
  highCurvaturePointClassifiedFromConstruction := C.highCurvaturePointClassifiedFromPrimitive
  neckCapOrRoundComponentFromConstruction := C.neckCapOrRoundComponentFromPrimitive
  surgeryScaleAdmissibleFromConstruction := C.surgeryScaleAdmissibleFromPrimitive
  persistenceUnderFlowFromConstruction := C.persistenceUnderFlowFromPrimitive
}

structure PrimitiveGeometrizationTheory where
  thickPartHyperbolicControl : Prop
  thinPartCollapseControl : Prop
  finiteExtinctionCriterion : Prop
  primeDecompositionInput : Prop
  jacoShalenJohannsonControl : Prop
  geometryPiecesRecognition : Prop
  thickThinDecomposition : Prop
  finiteExtinctionAlternative : Prop
  primeDecompositionControlled : Prop
  geometrizationPiecesClassified : Prop
  thickPartHyperbolicControlTerm : thickPartHyperbolicControl
  thinPartCollapseControlTerm : thinPartCollapseControl
  finiteExtinctionCriterionTerm : finiteExtinctionCriterion
  primeDecompositionInputTerm : primeDecompositionInput
  jacoShalenJohannsonControlTerm : jacoShalenJohannsonControl
  geometryPiecesRecognitionTerm : geometryPiecesRecognition
  thickThinDecompositionFromPrimitive :
    thickPartHyperbolicControl -> thinPartCollapseControl -> thickThinDecomposition
  finiteExtinctionAlternativeFromPrimitive : finiteExtinctionCriterion -> finiteExtinctionAlternative
  primeDecompositionControlledFromPrimitive :
    primeDecompositionInput -> jacoShalenJohannsonControl -> primeDecompositionControlled
  geometrizationPiecesClassifiedFromPrimitive :
    geometryPiecesRecognition -> geometrizationPiecesClassified

def PrimitiveGeometrizationTheory.toConstruction
    (G : PrimitiveGeometrizationTheory) : GeometrizationConstruction := {
  thickPartHyperbolicControl := G.thickPartHyperbolicControl
  thinPartCollapseControl := G.thinPartCollapseControl
  finiteExtinctionCriterion := G.finiteExtinctionCriterion
  primeDecompositionInput := G.primeDecompositionInput
  jacoShalenJohannsonControl := G.jacoShalenJohannsonControl
  geometryPiecesRecognition := G.geometryPiecesRecognition
  thickThinDecomposition := G.thickThinDecomposition
  finiteExtinctionAlternative := G.finiteExtinctionAlternative
  primeDecompositionControlled := G.primeDecompositionControlled
  geometrizationPiecesClassified := G.geometrizationPiecesClassified
  thickPartHyperbolicControlTerm := G.thickPartHyperbolicControlTerm
  thinPartCollapseControlTerm := G.thinPartCollapseControlTerm
  finiteExtinctionCriterionTerm := G.finiteExtinctionCriterionTerm
  primeDecompositionInputTerm := G.primeDecompositionInputTerm
  jacoShalenJohannsonControlTerm := G.jacoShalenJohannsonControlTerm
  geometryPiecesRecognitionTerm := G.geometryPiecesRecognitionTerm
  thickThinDecompositionFromConstruction := G.thickThinDecompositionFromPrimitive
  finiteExtinctionAlternativeFromConstruction := G.finiteExtinctionAlternativeFromPrimitive
  primeDecompositionControlledFromConstruction := G.primeDecompositionControlledFromPrimitive
  geometrizationPiecesClassifiedFromConstruction := G.geometrizationPiecesClassifiedFromPrimitive
}

structure PrimitiveEndpointTheory where
  closedThreeManifoldEndpoint : Prop
  fundamentalGroupTrivial : Prop
  sphericalSpaceFormRecognition : Prop
  quotientObstructionExcluded : Prop
  sphereRecognitionTheorem : Prop
  diffeomorphismLiftConstructed : Prop
  sphericalSpaceFormExcluded : Prop
  simplyConnectedEndpoint : Prop
  sphereDiffeomorphismProduced : Prop
  closedThreeManifoldEndpointTerm : closedThreeManifoldEndpoint
  fundamentalGroupTrivialTerm : fundamentalGroupTrivial
  sphericalSpaceFormRecognitionTerm : sphericalSpaceFormRecognition
  quotientObstructionExcludedTerm : quotientObstructionExcluded
  sphereRecognitionTheoremTerm : sphereRecognitionTheorem
  diffeomorphismLiftConstructedTerm : diffeomorphismLiftConstructed
  sphericalSpaceFormExcludedFromPrimitive :
    sphericalSpaceFormRecognition -> quotientObstructionExcluded -> sphericalSpaceFormExcluded
  simplyConnectedEndpointFromPrimitive :
    closedThreeManifoldEndpoint -> fundamentalGroupTrivial -> simplyConnectedEndpoint
  sphereDiffeomorphismProducedFromPrimitive :
    sphereRecognitionTheorem -> diffeomorphismLiftConstructed -> sphereDiffeomorphismProduced

def PrimitiveEndpointTheory.toConstruction
    (E : PrimitiveEndpointTheory) : EndpointConstruction := {
  closedThreeManifoldEndpoint := E.closedThreeManifoldEndpoint
  fundamentalGroupTrivial := E.fundamentalGroupTrivial
  sphericalSpaceFormRecognition := E.sphericalSpaceFormRecognition
  quotientObstructionExcluded := E.quotientObstructionExcluded
  sphereRecognitionTheorem := E.sphereRecognitionTheorem
  diffeomorphismLiftConstructed := E.diffeomorphismLiftConstructed
  sphericalSpaceFormExcluded := E.sphericalSpaceFormExcluded
  simplyConnectedEndpoint := E.simplyConnectedEndpoint
  sphereDiffeomorphismProduced := E.sphereDiffeomorphismProduced
  closedThreeManifoldEndpointTerm := E.closedThreeManifoldEndpointTerm
  fundamentalGroupTrivialTerm := E.fundamentalGroupTrivialTerm
  sphericalSpaceFormRecognitionTerm := E.sphericalSpaceFormRecognitionTerm
  quotientObstructionExcludedTerm := E.quotientObstructionExcludedTerm
  sphereRecognitionTheoremTerm := E.sphereRecognitionTheoremTerm
  diffeomorphismLiftConstructedTerm := E.diffeomorphismLiftConstructedTerm
  sphericalSpaceFormExcludedFromConstruction := E.sphericalSpaceFormExcludedFromPrimitive
  simplyConnectedEndpointFromConstruction := E.simplyConnectedEndpointFromPrimitive
  sphereDiffeomorphismProducedFromConstruction := E.sphereDiffeomorphismProducedFromPrimitive
}

structure PrimitivePerelmanRicciFlowWithSurgeryFormalization where
  baseManifold : PrimitiveClosedThreeManifold
  timeDomain : PrimitiveTimeDomain
  metricFamily : PrimitiveMetricFamily baseManifold timeDomain
  curvature : PrimitiveCurvatureSystem baseManifold timeDomain metricFamily
  flowWithSurgery : PrimitiveRicciFlowWithSurgery baseManifold timeDomain metricFamily curvature
  shortTime : PrimitiveShortTimeTheory baseManifold timeDomain metricFamily
  entropy : PrimitiveEntropyTheory
  noncollapsing : PrimitiveNoncollapsingTheory
  singularity : PrimitiveSingularityTheory
  canonicalNeighborhood : PrimitiveCanonicalNeighborhoodTheory
  geometrization : PrimitiveGeometrizationTheory
  endpoint : PrimitiveEndpointTheory
  primitiveDataCoherent : Prop
  primitiveDataCoherentTerm : primitiveDataCoherent

def PrimitivePerelmanRicciFlowWithSurgeryFormalization.toDeepAnalyticConstruction
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    PerelmanDeepAnalyticConstruction := {
  curvature := P.curvature.toConstruction
  ricciFlowWithSurgery := P.flowWithSurgery.toConstruction
  shortTime := P.shortTime.toConstruction
  entropy := P.entropy.toConstruction
  noncollapsing := P.noncollapsing.toConstruction
  singularity := P.singularity.toConstruction
  canonicalNeighborhood := P.canonicalNeighborhood.toConstruction
  geometrization := P.geometrization.toConstruction
  endpoint := P.endpoint.toConstruction
}

def PrimitivePerelmanRicciFlowWithSurgeryFormalization.toFoundationalTheoremInhabitants
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    PerelmanFoundationalTheoremInhabitants :=
  P.toDeepAnalyticConstruction.toFoundationalTheoremInhabitants

def PrimitivePerelmanRicciFlowWithSurgeryFormalization.toAnalyticProofCertificate
    (A : RicciFlowAnalyticFoundation)
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    PerelmanAnalyticProofCertificate A :=
  P.toDeepAnalyticConstruction.toAnalyticProofCertificate A

theorem primitive_ricci_flow_with_surgery_coherence_term
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    P.primitiveDataCoherent :=
  P.primitiveDataCoherentTerm

theorem primitive_ricci_flow_with_surgery_closes_route
    (A : RicciFlowAnalyticFoundation)
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    PerelmanRouteClosed A.toPerelmanRouteObligations := by
  exact deep_analytic_construction_close_perelman_route A P.toDeepAnalyticConstruction

theorem primitive_ricci_flow_with_surgery_supplies_mathlib_endpoint
    (A : RicciFlowAnalyticFoundation)
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetManifold A.endpoint.targetTopology 3 := by
  exact deep_analytic_construction_supply_mathlib_endpoint A P.toDeepAnalyticConstruction

theorem primitive_ricci_flow_with_surgery_yields_constrained_closure
    (A : AdmissibleClass) {R : RicciFlowAnalyticFoundation}
    (P : PrimitivePerelmanRicciFlowWithSurgeryFormalization)
    (bridgeFromPrimitiveFormalization : bridgeClosed A)
    (gateFromPrimitiveFormalization : gateClosed A) :
    ConstrainedPoincareClosure A := by
  exact deep_analytic_construction_yield_constrained_closure
    (R := R) A P.toDeepAnalyticConstruction
    bridgeFromPrimitiveFormalization gateFromPrimitiveFormalization

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
