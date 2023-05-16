// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BookmarkController from "./bookmark_controller"
application.register("bookmark", BookmarkController)

import FavoriteController from "./favorite_controller"
application.register("favorite", FavoriteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ItinerariesController from "./itineraries_controller"
application.register("itineraries", ItinerariesController)

import MapController from "./map_controller"
application.register("map", MapController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import QuestionsController from "./questions_controller"
application.register("questions", QuestionsController)

import RatingController from "./rating_controller"
application.register("rating", RatingController)

import RealTripController from "./real_trip_controller"
application.register("real-trip", RealTripController)

import SwitchController from "./switch_controller"
application.register("switch", SwitchController)
